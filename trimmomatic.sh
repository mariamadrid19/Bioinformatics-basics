#!/bin/bash
# AUTHOR: Alejandro Castellanos Sánchez

# Trimmomatic basic usage

# Load Trimmomatic
module load trimmomatic

# Running Trimmomatic for pair-end reads
# Trimming parameters must be changed as required
trimmomatic PE reads_R1.fastq reads_R2.fastq reads_R1_paired_clean.fastq reads_R2_unpaired_clean.fastq reads_R2_paired_clean.fastq reads_R2_unpaired_clean.fastq ILLUMINACLIP:### SLIDINGWINDOW:### MINLEN:###

# Script for running Trimmomatic automatically for all the files in a direactory named reads-raw. Text file .txt with the IDs from the samples is required.
# This script is customized for pair-end reads. It assumes that for each senquenced sample, the only difference between the names of the forward and revserse files is _R1 and _R2 respectively
# Clean reads are stored in a directory called clean-reads

mkdir -p reads-clean
for i in $(cat sequenced_samples.txt); do
	fext=.fastq # or .fq | .fastq.gz | .fq.gz
	trimmomatic PE reads-raw/$i_R1$fext reads-raw/$i_R1$fext reads-clean/$i_R1_paired_clean$fext reads-clean/$i_R1_paired_clean$fext reads-clean/$i_R2_paired_clean$fext reads-clean/$i_R2_paired_clean$fext ILLUMINACLIP:### SLIDINGWINDOW:### MINLEN:###
done