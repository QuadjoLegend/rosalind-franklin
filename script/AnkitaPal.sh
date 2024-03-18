#!/bin/bash

#Login to your coding workspace
#Create a folder titled your name

mkdir AnkitaPal

#Create another new directory titled biocomputing and change to that directory with one line of command'

mkdir biocomputing
cd biocomputing
# Downloading the files
touch wildtype.fna wildtype.gbk
curl https://raw.githubusercontent.com/jogosa2/dataset-repos/main/wildtype.fna --output wildtype.fna
curl https://raw.githubusercontent.com/jogosa2/dataset-repos/main/wildtype.gbk --output wildtype.gbk
# To Check whether the files are includedin the folder
ls
# To view the the downloaded files
cat wildtype.fna
cat wildtype.gbk
# To move the wildtype.fna file to the AnkitaPal folder
mv wildtype.fna C:/users/User/Desktop/Hackbio1/AnkitaPal

#Deleting the  gbk file because it is a duplicate file
rm wildtype.gbk

#Qn To check whether the given fna file  is mutant or  wild type
nano Tata.sh
if grep -q "tata" <<< "$wildtype.fna";
then
    echo "The file is of wild type"
else
    echo "The file is of mutant type"
fi
#Executing the bash file 
bash Tata.sh

#The given file is mutant, so printing  all the lines that shows it is mutant into a new file
#Creating a bash file
nano myscript.sh
string="tatatata"
file="C:/Users/User/Desktop/Hackbio1/AnkitaPal/wildtype.fna"
grep -n "$string" "$file"
#executing it
bash myscript.sh

#Downloading the gene of my interest which is Fos gene in human 
curl https://www.ebi.ac.uk/ena/browser/api/fasta/V01512.1?lineLimit=1000 --output fos.fna
#Viewing the fasta file of  gene of our interest
cat fos.fna
#Numbering the lines of the  given sequence file
cat fos.fna | nl

#Counting the number of lines excluding the header
grep -v '>' fos.fna | wc -l

#Counting the number of times of occurrence of the  A,G,C,T bases
A=$(grep -v '>' fos.fna | grep -io 'A' fos.fna | wc -l)
G=$(grep -v '>' fos.fna | grep -io 'G' fos.fna | wc -l)
C=$(grep -v '>' fos.fna | grep -io 'C' fos.fna | wc -l)
T=$(grep -v '>' fos.fna | grep -io 'T' fos.fna | wc -l)

#Calculating the percentage of GC content
nano gc.sh
gc=$(grep -v '>' fos.fna | grep -io 'G\|C' fos.fna | wc -l)
total=$(grep -v '>' fos.fna | tr -cd '[:graph:]' | wc -c)
percent=$(expr 100 \* $gc / $total )
echo "Percentage of GC content is : "$percent" "

#Creating a new nucleotide file with my name and appending the result of the number of  occurences in the sequence.
touch AnkitaPal.txt
echo "The A occurs "$A" times" >> AnkitaPal.txt
echo "The G occurs "$G" times" >> AnkitaPal.txt
echo "The C occurs "$C" times" >> AnkitaPal.txt
echo "The T occurs "$T" times" >> AnkitaPal.txt

#Finally we  saved all the codes that were used.
