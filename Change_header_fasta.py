#!/bin/python
# coding: utf-8
# AUTHOR: Alejandro Castellanos Sanchez

# In[6]:
###Script to change header of fasta

import sys

#Load the multifasta file
f=(sys.argv[1])
file = open(sys.argv[1],'r')
labels=f.split(".")

#Write new multifasta, modified
handle = open(labels[0]+"_new"+".fasta","w")
line=file.readlines()

#Loop for changing the name of each header within the mulifasta
count=0
for l in line:
    results=l.startswith(">")
    results
    if results == True:
        count+=1
        handle.write(">"+str(count)+"_"+labels[0]+"\n")
    else:
        handle.write(str(l))

handle.close()
