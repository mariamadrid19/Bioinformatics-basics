#!/bin/bash

#SBATCH --job-name=Calidad_Unalignment
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --cpus-per-task=1
#SBATCH --mem=40960
#SBATCH --time=05:00:00
#SBATCH --mail-user=a.castellanoss@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o Calidad_Unalignment.o

cd /hpcfs/home/a.castellanoss/Unalignment_ABRIL2019/Lecturas

module load fastqc/0.11.7

fastqc Undetermined_S0_R1_001.fastq -o Undetermined_S0_R1
fastqc Undetermined_S0_R2_001.fastq -o Undetermined_S0_R2