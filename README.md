# TDP-43 LOSS: THE CHROMOSOME X IMPACT
### Transcriptomic Profiling of TDP-43 Loss-of-Function in ALS Models

[cite_start]**Affiliation:** KAUST Academy - Stage 3 (Genomics Track) [cite: 154]
**Date:** February 2026

## 👥 Group Members
* **Haitham Alahmadi** [cite: 159]
* **Ibrahim Eissa** [cite: 160]
* **Ahmed Mawlawi** [cite: 161]

## 📝 Abstract
**Background:** The loss of TDP-43 function is a hallmark of ALS, leading to widespread RNA dysregulation. [cite_start]This study investigates the specific transcriptomic impact of TDP-43 depletion on **Chromosome X** to identify potential sex-linked vulnerabilities in neurodegeneration[cite: 172, 173].

**Methods:** Using RNA-seq data (GSE136366) from control and TDP-43 knockdown samples, we implemented a complete bioinformatics pipeline. [cite_start]Reads were aligned to the human Chromosome X reference (GRCh38) using HISAT2, and gene expression was quantified via featureCounts[cite: 174, 175].

## 📂 Project Structure
The workspace is organized as follows:
```text
.
├── alignment/              # Output from HISAT2 (BAM files)
├── counts/                 # Output from featureCounts
├── logs/                   # Log files from tools
├── qc_reports/             # Quality Control Results
│   ├── fastp/              # fastp HTML/JSON reports
│   ├── fastqc_raw/         # FastQC on raw data
│   ├── fastqc_trimmed/     # FastQC on trimmed data
│   ├── multiqc_all.html    # ⭐️ Aggregate QC Report
│   └── multiqc_all_data/   # MultiQC raw data files
├── raw_data/               # Raw FASTQ sequences (Control & Knockout)
├── references/             # Genome (FASTA) & Annotation (GTF)
├── results/                # Final Analysis Results
│   ├── enrichment/
│   ├── figures/
│   └── tables/
├── salmon_quant/           # Transcript quantification
├── subsampled_data/        # Pilot test data
└── trimmed_data/           # Cleaned FASTQ files
