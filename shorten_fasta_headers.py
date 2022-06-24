#!/bin/python
# coding: utf-8
# AUTHOR: Alejandro Castellanos Sánchez

# Script to shorten the headers of a fasta file

# Usage
# python shorten_fasta_headers.py file.fasta

import sys

# Define variables with the file name information
file_name = sys.argv[1]
basename = file_name.split('.')[0]
extension = file_name.split('.')[1]

# Load original fasta file
with open(file_name,'r') as file:
    lines = file.readlines()

# Create new fasta file with modifications
with open(f'{file_name}_shortened.{extension}','w') as new_file:
    # Loop for changing the name of each header within the fasta file
    count = 0
    for l in lines:
        if l.startswith('>'):
            count += 1
            new_file.write(f'>{str(count)}_{basename}\n')
        else:
            new_file.write(str(l))