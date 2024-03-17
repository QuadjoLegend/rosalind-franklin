#Create a folder titled your name
mkdir Tincy

#Create another new directory titled biocomputing and change to that directory with one line of command
mkdir biocomputing && cd biocomputing

#Download these 3 files:a.	https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna 
#b.	https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
#c.	https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk
wget https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk ttps://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.gbk--2024-03-17 18:22:47--  https://raw.githubusercontent.com/josoga2/dataset-repos/main/wildtype.fna

#OH! You made a mistake. You have to move the .fna file to the folder titled your name directly.
mv wildtype.fna /mnt/c/Users/Tincy\ John/Bioinfo/Tincy/wildtype.fna

#OH No! The gbk file is a duplicate, they are actually the same thing. Please delete it
rm wildtype.gbk.1

#7.	The .fna file is actually from a bacteria, and it should definitely have a TATA (tata) box for initiating gene transcription. The molecular biologist is trying to understand the implication of dual TATA sequences. The files got mixed up and we are not sure which is wildtype and which is mutant. The mutant should have “tatatata” while the normal should have just “tata”. Can you confirm if the file is mutant or wild type
cd..
cd Tincy
grep -o 'tatatata\|tata' wildtype.fna
#mutant type- presence of tatatata

#If it is mutant, print all the lines that show it is a mutant into a new file
grep -n tatatata wildtype.fna>Mutant_seq.txt

#Each team member should pick a unique gene different from every other person 
#HEX_A

#Download the fasta format of the gene from NCBI Nucleotide
wget -O HEX_A.fasta "https://www.ncbi.nlm.nih.gov/sviewer/viewer.fcgi?db=nuccore&report=fasta&id=NM_001272455.2"

#How many lines are in the FASTA file (with the exception of the header)
grep -v "^>" HEX_A.fasta | grep -v "^$" | wc -l
#or
rep -c -v "^>\|^$" HEX_A.fasta
#60 lines

#How many times does A occur
grep -v "^>" HEX_A.fasta | tr -cd 'A' | wc -c
#1343 (excluding the header)

#How many times does G occur
grep -v "^>" HEX_A.fasta | tr -cd 'G' | wc -c
#971 (excluding the header)

#How many times does C occur
grep -v "^>" HEX_A.fasta | tr -cd 'C' | wc -c
#887 (excluding the header)

#How many times does T occur
grep -v "^>" HEX_A.fasta | tr -cd 'T' | wc -c
#938 (excluding the header)

#Calculate the %GC content of your gene
#formula= (no. of G + no. of C)/(total no. of ATGC)*100
echo "scale=4; ($(grep -v "^>" HEX_A.fasta | tr -cd 'G' | wc -c)+$(grep -v "^>" HEX_A.fasta | tr -cd 'C' | wc -c))/$(grep -v "^>" HEX_A.fasta | tr -cd '[ATGC]' | wc -c)*100" | bc
#44.89%

#Create a nucleotide file title your name
touch Tincy.fasta

#echo” the following into the file using >>: the number of A, G, T and C in the file you created above.
echo "The occurence of each base:">>Tincy.fasta
echo "A: $(grep -v "^>" HEX_A.fasta | tr -cd 'A' | wc -c)" "G: $(grep -v "^>" HEX_A.fasta | tr -cd 'G' | wc -c)" "C: $(grep -v "^>" HEX_A.fasta | tr -cd 'C' | wc -c)" "T: $(grep -v "^>" HEX_A.fasta | tr -cd 'T' | wc -c)">>Tincy.fasta

#Upload the file to your team’s github repo in a folder called /output
mkdir output
mv Tincy.fasta /mnt/c/Users/Tincy\ John/Bioinfo/Tincy/output

#Save all the codes you have used in this project in a file named yourname.sh Upload all the codes you have used to your team’s github repo in a folder called /script
