#!/bin/bash

module load fastqc/0.11.7

fastqc Undetermined_S0_R1_001.fastq -o Undetermined_S0_R1
fastqc Undetermined_S0_R2_001.fastq -o Undetermined_S0_R2