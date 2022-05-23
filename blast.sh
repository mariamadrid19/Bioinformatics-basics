#!/bin/bash

#Loading the blast module from the Uniandes cluster
module load blast/2.12.0+

#First, you create the database. You can use a previously available db (.fasta), or one you created. You specify the db type and the name of the output directory
makeblastdb -in 01-archivos/base_de_datos_BLAST.fasta -dbtype prot -out 01-archivos/blastdb


#The blastp (blastx, blastn, blastt), is run following specific parameters. Query, evalue, max_seqs...
blastp -db 01-archivos/blastdb -query 02-prediccion/seqs_aa_003_prodigal.fasta -max_target_seqs 1 -evalue 0.0001 -html -out 03-anotacion/busqueda_proteinas_003_prodigal.html

blastp -db 01-archivos/blastdb -query 02-prediccion/seqs_aa_003_prodigal.fasta -max_target_seqs 1 -evalue 0.0001 -outfmt 6 -out 03-anotacion/busqueda_proteinas_003_prodigal.tsv

# https://www.metagenomics.wiki/tools/blast/blastn-output-format-6