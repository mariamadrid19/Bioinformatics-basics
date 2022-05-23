#!/bin/bash
#Author: Alejandro Castellanos Sanchez

#### Usage
# bash taxonomic_assignation_metaplhan.sh &> taxonomic_assignation_metaplhan.o

# conda activate mpa

# echo "MetaPhlan with BowTie"

for i in clean-reads/*; do
	FNAME=$(basename $i .fastq);
	metaphlan $i --input_type fastq --bt2_ps very-sensitive --tax_lev 's' -t rel_ab --nproc 4 -o taxonomic-assignation/$(echo $FNAME)_profiled_metagenome.txt
	mv $i.bowtie2out.txt taxonomic-assignation
done

# ## Merge tables
# echo "merge tables"
# merge_metaphlan_tables.py taxonomic-assignation/*_profiled_metagenome.txt -o taxonomy-results/taxonomy_assignation.txt

# ## Heatmap
# echo "create heatmap"
# hclust2.py -i taxonomy-results/taxonomy_assignation_.txt -o taxonomy-results/taxonomy_heatmap.png

# ## Krona
# echo "create krona"
# metaphlan2krona.py -p taxonomy-results/taxonomy_assignation.txt -k taxonomy-results/taxonomy_assignation_krona.txt
# ktImportText taxonomy-results/taxonomy_assignation_krona.txt -o taxonomy-results/taxonomy_assignation_krona.html

echo "MetaPhlan without BowTie"
for i in taxonomic-assignation/*.fastq.bowtie2out.txt; do
	FNAME=$(basename $i .fastq);
	metaphlan $i --input_type bowtie2out --tax_lev 'a' -t rel_ab --nproc 4 -o taxonomic-assignation/$(echo $FNAME)_profiled_metagenome2.txt
done

# ## Merge tables
# echo "merge tables"
# merge_metaphlan_tables.py taxonomic-assignation/*_profiled_metagenome2.txt -o taxonomy-results/taxonomy_assignation2.txt

# ## Krona
# echo "create krona"
# metaphlan2krona.py -p taxonomy-results/taxonomy_assignation2_.txt -k taxonomy-results/taxonomy_assignation_krona2.txt
# ktImportText taxonomy-results/taxonomy_assignation_krona2.txt -o taxonomy-results/taxonomy_assignation_krona2.html