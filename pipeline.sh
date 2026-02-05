#!/bin/bash
# TDP-43 Chromosome X Analysis Pipeline
# Project: Transcriptomic Profiling of TDP-43 Loss
# Author: KAUST Academy Group 4

# ==========================================
# 1. Project Setup & Hierarchy
# ==========================================
echo "Initializing Project Structure..."
mkdir -p alignment counts logs
mkdir -p qc_reports/fastqc_raw qc_reports/fastqc_trimmed qc_reports/fastp
mkdir -p results/tables results/figures results/enrichment
mkdir -p subsampled_data trimmed_data references salmon_quant

# ==========================================
# 2. Quality Control (Raw Data)
# ==========================================
echo "Running FastQC on Raw Data..."
fastqc raw_data/*.fastq.gz -o qc_reports/fastqc_raw -t 4

echo "Running SeqKit Statistics..."
seqkit stats raw_data/*.fastq.gz > seqkit_stats.tsv

# ==========================================
# 3. Reference Genome Acquisition
# ==========================================
cd references
# Download Chromosome X FASTA
curl -O https://ftp.ensembl.org/pub/release-115/fasta/homo_sapiens/dna/Homo_sapiens.GRCh38.dna.chromosome.X.fa.gz
gunzip Homo_sapiens.GRCh38.dna.chromosome.X.fa.gz

# Download and Filter GTF
curl https://ftp.ensembl.org/pub/release-115/gtf/homo_sapiens/Homo_sapiens.GRCh38.115.gtf.gz | \
gunzip -c | grep "^X" > Homo_sapiens.GRCh38.115.chrX.gtf
cd ..

# ==========================================
# 4. Alignment (HISAT2)
# ==========================================
# Build Index
hisat2-build references/Homo_sapiens.GRCh38.dna.chromosome.X.fa references/chrX_index

# Align Samples (Loop)
for file in raw_data/*_1.fastq.gz; do
    base=$(basename $file "_1.fastq.gz")
    echo "Aligning $base..."
    hisat2 -p 4 -x references/chrX_index \
           -1 raw_data/${base}_1.fastq.gz \
           -2 raw_data/${base}_2.fastq.gz \
           -S alignment/${base}.sam
    
    # Convert to BAM & Sort
    samtools sort -o alignment/${base}.sorted.bam alignment/${base}.sam
    rm alignment/${base}.sam
done

# ==========================================
# 5. Quantification (featureCounts)
# ==========================================
echo "Counting Reads..."
featureCounts -T 4 \
              -a references/Homo_sapiens.GRCh38.115.chrX.gtf \
              -o counts/chrX_counts.txt \
              -t exon -g gene_id \
              alignment/*.sorted.bam

# ==========================================
# 6. Aggregate QC (MultiQC)
# ==========================================
echo "Generating Final QC Report..."
multiqc . -o qc_reports -n multiqc_all.html
