#!/bin/bash

# Script for genome assemblies submission to the ENA

## References: 
# https://ena-docs.readthedocs.io/en/latest/submit/assembly/genome.html#introduction
# https://ena-docs.readthedocs.io/en/latest/submit/assembly.html
# https://ena-docs.readthedocs.io/en/latest/submit/general-guide/webin-cli.html

## Download Latest Webin-CLI Version: https://github.com/enasequence/webin-cli/releases/tag/4.5.2

## The following script requires that:
# 1) Fasta files of the assemblies and their corresponding manifest files are located in the current folder
# 2) Yoy have Java installed in your computer, ideally openjdk version 1.8.0_212 (or equvalent) or latest
# 2) webin-cli-4.5.2.jar executable file is located in the current folder
# 3) Your manifest files are saved as tab-separeted values files (.tsv)
# 4) Fasta files are compressed as gzip files (.gz)

## Minimal requerements for manifest file:
# STUDY	
# SAMPLE	
# ASSEMBLYNAME	
# ASSEMBLY_TYPE	
# COVERAGE	
# PROGRAM	
# PLATFORM	
# MOLECULETYPE	
# DESCRIPTION	
# FASTA	

# Note that you should replace the XXX for the proper username and password

for i in *.tsv; do 
	java -jar webin-cli-4.5.2.jar -context genome -manifest $i -username Webin-XXX -password XXX -submit; 
done

# In case of just submiting one assmbly you can simply run:
# java -jar webin-cli-4.5.2.jar -context genome -manifest manifest.tsv -username Webin-XXX -password XXX -submit