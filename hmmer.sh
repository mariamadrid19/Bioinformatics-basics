#!/bin/bash

#SBATCH --job-name=04_anotacion_hmmer
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --cpus-per-task=4
#SBATCH --mem=40000
#SBATCH --time=5-00:00:00
#SBATCH --mail-user=a.castellanoss@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o 04_anotacion_hmmer.o

module load hmmer/3.3.2

hmmpress 01-archivos/base_de_datos_HMMER.hmm

hmmsearch --tblout 03-anotacion/anotacion_003_hmmer.tsv --cpu 4 01-archivos/base_de_datos_HMMER.hmm 02-prediccion/seqs_aa_003_prodigal.fasta > 03-anotacion/rawseq_003.txt # --cut_ga