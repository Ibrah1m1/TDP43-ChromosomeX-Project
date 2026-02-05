# TDP-43 LOSS: THE CHROMOSOME X IMPACT
### Transcriptomic Profiling of TDP-43 Loss-of-Function in ALS Models

[cite_start]**Affiliation:** KAUST Academy - Stage 3 (Genomics Track) [cite: 154]
**Date:** February 2026

## 👥 Group Members
* [cite_start]**Haitham Alahmadi** [cite: 159]
* [cite_start]**Ibrahim Eissa** [cite: 160]
* [cite_start]**Ahmed Mawlawi** [cite: 161]

## 📝 Abstract
**Background:** The loss of TDP-43 function is a hallmark of ALS, leading to widespread RNA dysregulation. [cite_start]This study investigates the specific transcriptomic impact of TDP-43 depletion on **Chromosome X** to identify potential sex-linked vulnerabilities in neurodegeneration[cite: 172, 173].

**Methods:** Using RNA-seq data (GSE136366) from control and TDP-43 knockdown samples, we implemented a complete bioinformatics pipeline. [cite_start]Reads were aligned to the human Chromosome X reference (GRCh38) using HISAT2, and gene expression was quantified via featureCounts[cite: 174, 175].

## 📂 Project Structure
[cite_start]Based on the project initialization, the workspace is organized as follows[cite: 225]:
```text
.
├── alignment/
├── counts/
├── logs/
├── qc_reports/
│   ├── fastp/
│   ├── fastqc_raw/
│   └── fastqc_trimmed/
├── raw_data/
├── references/
├── results/
│   ├── enrichment/
│   ├── figures/
│   └── tables/
├── salmon_quant/
├── subsampled_data/
└── trimmed_data/
