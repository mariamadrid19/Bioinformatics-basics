#!/bin/bash

module load trimmomatic/0.39

trimmomatic PE -phred33 -trimlog trimClean_S0.log Undetermined_S0_R1_001.fastq Undetermined_S0_R2_001.fastq Undetermined_S0_R1_001.paired_clean.fastq Undetermined_S0_R1_001.unpaired_clean.fastq Undetermined_S0_R2_001.paired_clean.fastq Undetermined_S0_R2_001.unpaired_clean.fastq ILLUMINACLIP:Adapters.fasta:2:30:10 SLIDINGWINDOW:4:20 MINLEN:150