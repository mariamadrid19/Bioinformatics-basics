#!/bin/bash

#SBATCH --job-name=checkm
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --cpus-per-task=4
#SBATCH --mem=40000
#SBATCH --time=5-00:00:00
#SBATCH --mail-user=a.castellanoss@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o checkm.o

cd /hpcfs/home/a.castellanoss/vibrio-project/genomes-quality/checkm/

source /hpcfs/home/a.castellanoss/anaconda3/bin/activate
conda activate vibrio-project

checkm taxonomy_wf species 'Vibrio parahaemolyticus' -t 4 ./bins ./output -x fasta --tab_table
