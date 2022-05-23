#!/bin/bash

source /hpcfs/home/a.castellanoss/anaconda3/bin/activate
conda activate vibrio-project

checkm taxonomy_wf species 'Vibrio parahaemolyticus' -t 4 ./bins ./output -x fasta --tab_table
