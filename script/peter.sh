#!/bin/bash
#
#Create a folder titled your name
mkdir peterloh

#Create another new directory titled biocomputing and change to that directory with one line of command
mkdir biocomputing && cd biocomputing

#Download 3 files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna \
     https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk \
     https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

#Move fna file to name directory
mv wildtype.fna ~/peterloh

#Delete gbk duplicate
rm wildtype.gbk.1

#Check for mutation in fna file
cd ~/peterloh && grep 'tata' wildtype.fna && grep 'tatatata' wildtype.fna

#Print mutant sequence into a new file
grep 'tatatata' wildtype.fna >> mutate.fna

#Download fasta file of Homo sapiens chromosome 10 clone PTEN, complete sequence
wget -O PTEN.fasta "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?db=nuccore&report=fasta&id=AF067844.1"

echo "Number of sequence lines excluding header: "
grep -v '>' PTEN.fasta | wc -l

echo "Number of A: "
grep -v '>' PTEN.fasta |tr -dc 'A' | wc -c

echo "Number of G: "
grep -v '>' PTEN.fasta |tr -dc 'G' | wc -c

echo "Number of C: "
grep -v '>' PTEN.fasta |tr -dc 'C' | wc -c

echo "Number of T: "
grep -v '>' PTEN.fasta |tr -dc 'T' | wc -c

echo "GC percentage: "
echo "scale=2; ($(grep -v '>' PTEN.fasta |tr -dc 'G' | wc -c) + $(grep -v '>' PTEN.fasta | tr -dc 'C' | wc -c)) / $(grep -v '>' PTEN.fasta |tr -dc 'AGTC' | wc -c) * 100" | bc

#Create a nucleotide file title your name
echo "The number of nucleotides in the sequence:
 A: $(grep -v '>' PTEN.fasta |tr -dc 'A' | wc -c)
 G: $(grep -v '>' PTEN.fasta |tr -dc 'G' | wc -c)
 C: $(grep -v '>' PTEN.fasta |tr -dc 'C' | wc -c)
 T: $(grep -v '>' PTEN.fasta |tr -dc 'T' | wc -c)" >> peter.fasta
