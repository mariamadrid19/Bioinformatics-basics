#!/bin/bash
#Así se empieza un script de bash (shellscript)
#Se usa la misma terminología que en la línea de comandos 

#Este es el cuerpo de un job de SBATCH
#SBATCH --job-name=job_name_x
#SBATCH -p medium
#SBATCH -N 1
#SBATCH -n 8
#SBATCH --cpus-per-task=4
#SBATCH --mem=40000
#SBATCH --time=5-00:00:00
#SBATCH --mail-user=ma.madrid@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o job_name_X.o
