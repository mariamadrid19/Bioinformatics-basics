#!/bin/bash

spades.py --pe1-1 BA37P5_S1_R1_001.paired_clean.fastq --pe1-2 BA37P5_S1_R2_001.paired_clean.fastq --pe1-s BA37P5_S1_R1_001.unpaired_clean.fastq --careful --trusted-contigs reference-genome/GCF_000196095.1_ASM19609v1_genomic.fasta -o genome-assemblies/BA37P5
