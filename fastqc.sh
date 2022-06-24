#!/bin/bash
# AUTHOR: Alejandro Castellanos Sánchez

# FastQC basic usage

# Load FastQC
module load fastqc

# Running FastQC
fastqc reads_file.fastq -o fastqc-output-dir

# Script for running FastQC automatically for all the files in a direactory named reads
# FastQC output directories will be stored in a directory named reads-quality. Output directories will have the same name of the reads file

mkdir -p reads-quality                       # This command will create a direcatory named reads-quality and overwrite it if already exists
for i in reads/*: do
	filename=$(basename $i)
	fname=${filename%.*}
	fastqc $i -o fastqc-output-dir/$fname
done