#!/bin/bash


module load hmmer/3.3.2

hmmpress base_de_datos_HMMER.hmm

hmmsearch --tblout anotacion_hmmer.tsv --cpu 4 base_de_datos_HMMER.hmm seqs_aa_003_prodigal.fasta > rawseq_003.txt # --cut_ga