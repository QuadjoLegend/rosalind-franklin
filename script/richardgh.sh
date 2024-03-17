#!/bin/bash
#
#Create a folder titled your name
mkdir richardgh

#Create another new directory titled biocomputing and change to that directory with one line of command
mkdir biocomputing && cd biocomputing

#Download 3 files
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna \
     https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk \
     https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk

#Move fna file to name directory
mv wildtype.fna ~/richardgh

#Delete gbk duplicate
rm wildtype.gbk.1

#Check for mutation in fna file
cd ~/richardgh && grep 'tata' wildtype.fna && grep 'tatatata' wildtype.fna

#Print mutant sequence into a new file
grep 'tatatata' wildtype.fna >> mutant.fna

#Download fasta file of human beta hemoglobin gene
wget -O hemoglobin.fasta "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?db=nuccore&report=fasta&id=NG_059281.1"

echo "Number of sequence lines excluding header: "
grep -v '>' hemoglobin.fasta | wc -l

echo "Number of A: "
grep -v '>' hemoglobin.fasta |tr -dc 'A' | wc -c

echo "Number of G: "
grep -v '>' hemoglobin.fasta |tr -dc 'G' | wc -c

echo "Number of C: "
grep -v '>' hemoglobin.fasta |tr -dc 'C' | wc -c

echo "Number of T: "
grep -v '>' hemoglobin.fasta |tr -dc 'T' | wc -c

echo "GC percentage: "
echo "scale=2; ($(grep -v '>' hemoglobin.fasta |tr -dc 'G' | wc -c) + $(grep -v '>' hemoglobin.fasta | tr -dc 'C' | wc -c)) / $(grep -v '>' hemoglobin.fasta |tr -dc 'AGTC' | wc -c) * 100" | bc

#Create a nucleotide file title your name
echo "A: $(grep -v '>' hemoglobin.fasta |tr -dc 'A' | wc -c)
 G: $(grep -v '>' hemoglobin.fasta |tr -dc 'G' | wc -c)
 C: $(grep -v '>' hemoglobin.fasta |tr -dc 'C' | wc -c)
 T: $(grep -v '>' hemoglobin.fasta |tr -dc 'T' | wc -c)" >> richardgh.fasta


