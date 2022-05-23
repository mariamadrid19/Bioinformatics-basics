#!/bin/bash

#SBATCH --job-name=02_anotacion_blast
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --cpus-per-task=4
#SBATCH --mem=40000
#SBATCH --time=5-00:00:00
#SBATCH --mail-user=a.castellanoss@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o 02_anotacion_blast.o

module load blast/2.12.0+

makeblastdb -in 01-archivos/base_de_datos_BLAST.fasta -dbtype prot -out 01-archivos/blastdb

blastp -db 01-archivos/blastdb -query 02-prediccion/seqs_aa_003_prodigal.fasta -max_target_seqs 1 -evalue 0.0001 -html -out 03-anotacion/busqueda_proteinas_003_prodigal.html

blastp -db 01-archivos/blastdb -query 02-prediccion/seqs_aa_003_prodigal.fasta -max_target_seqs 1 -evalue 0.0001 -outfmt 6 -out 03-anotacion/busqueda_proteinas_003_prodigal.tsv

# https://www.metagenomics.wiki/tools/blast/blastn-output-format-6