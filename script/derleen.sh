#!/bin/bash


# Create a folder titled with your name
mkdir derleen

# Create a new directory titled "biocomputing" and change to that directory using a single command by chaining multiple commands together with &&
mkdir biocomputing && cd biocomputing

# Download these 3 files:
# https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna 
# https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
# https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk 

wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna \
     https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk \
     https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk


# Move the file wildtype.fna from the folder biocomputing to the folder Derleen
mv wildtype.fna ../derleen

# Delete one of the .gbk files because they are actually a duplicate
rm wildtype.gbk.1

# To determine whether the .fna file contains a sequence with "tatatata" (mutant) or "tata" (wildtype)
# grep command in linux is used to search for patterns
# Change directory to the folder you had moved wildtype.fna to.
cd ../derleen && grep -o 'tatatata\|tata' wildtype.fna


# print all the lines that show it is a mutant to a new file 
grep -n 'tatatata' wildtype.fna > mutant_lines.txt


# My favorite gene is Heatshock gene(HSPs)
# Downloading my favorite gene
# Find the Gene FASTA sequence in NCBI and download
wget -O sequence.fasta "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?db=nuccore&report=fasta&id=NM_001010842.3"

# To count the number of lines in the FASTA sequence file excluding the header
awk '/^>/ {next} {print}' sequence.fasta | wc -l

# To count how many times the nucleotide "A occurs"
awk '/^>/ {next} {print}' sequence.fasta | grep -o -i "A" | wc -l

# How many times G occurs
awk '/^>/ {next} {print}' sequence.fasta | grep -o -i "G" | wc -l

# How many times C occurs
awk '/^>/ {next} {print}' sequence.fasta | grep -o -i "C" | wc -l

# How many times T occurs
awk '/^>/ {next} {print}' sequence.fasta | grep -o -i "T" | wc -l

# Calculate the %GC content
echo "scale=2; ($(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i 'G' | wc -l) + $(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i 'C' | wc -l)) / $(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i '[ACGT]' | wc -l) * 100" | bc

# Create a nucleotide file titled with your name
nano derleen.fasta

# echo the following into the file using >>: the number of A, G, T, and C in the file you created above
echo "Counts of nucleotides in sequence.fasta:" >> derleen.fasta
echo "A: $(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i 'A' | wc -l)" >> derleen.fasta
echo "G: $(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i 'G' | wc -l)" >> derleen.fasta
echo "T: $(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i 'T' | wc -l)" >> derleen.fasta
echo "C: $(awk '/^>/ {next} {print}' sequence.fasta | grep -o -i 'C' | wc -l)" >> derleen.fasta



