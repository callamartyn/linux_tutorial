#!/bin/bash
# find all the files ending in .fastq
files=$(find . -name "*.fastq")

# looping through the list of fastq files
for fastq in $files
do
  # set name variable to the part of the file name before the suffix
  name=$(basename $fastq ".fastq")
  # set the reads variable to count the number of occurences of the header
  reads=$(grep -c "@SRR805412" $fastq)
  if (($reads > 3000))
  then
    # print out the name and the reads
    echo "${fastq} has ${reads} reads"
  fi
done
