#!/bin/bash
# find all the files ending in .fastq
files=$(find . -name "*.fastq")

# looping through the list of fastq files
for fastq in $files
do
  # count the first part of the header
  grep -c "@SRR805412" $fastq
done
