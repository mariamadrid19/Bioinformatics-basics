#!/bin/bash

module load prodigal/2.6.3

prodigal -i genoma_ensamblado003.fasta -a seqs_aa_003_prodigal.fasta -d seqs_nt_003_prodigal.fasta -s potential_genes_003_prodigal.tsv