#!/bin/python
# coding: utf-8
# AUTHOR: Alejandro Castellanos Sánchez

# Script for manifest files creation from a template table

# USAGE
# python create_manifest_files.py manifest_table.xlsx

import pandas as pd
import sys

# Load the table with the infromation required for the manifest files
# Each row of the table represents a sample
table = pd.read_excel(str(sys.argv[1]))

# Create a manifest file for each sample
for index, row_values in table.iterrows():
    row_values.to_csv(f"{row_values['ASSEMBLYNAME']}_maifest.tsv", sep='\t', header=False)