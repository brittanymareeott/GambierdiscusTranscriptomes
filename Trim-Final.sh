#!/bin/sh

# This script runs Trimmomatic on raw Gambierdiscus reads
# This script is different from version 1 as it includes the ILLUMINACLIP command and the MINLEN command

# To run this script, ensure that you are in the folder containing the: PE read files, a copy of the trimmomatic.jar file, and a copy of the ILLUMINACLIP fasta file

# Command (unix): $ nohup nice sh Trim_final.sh &

cd ~/Gambierdiscus_Pooled_Lib/ILLUMINA_DATA/

mkdir Sample2_trimmed

# This command calls the trimmomatic jar file, utilizing paired-end (PE) forward and reverse reads for each sample
# It outputs 4 files: one each for forward paired and unpaired, as well as reverse paired and unpaired
# Unpaired indicates that it could not find its counterpart in the opposite file (e.g. forward could not find reverse pair)
# HEADCROP:8 cuts the first 8 bp at the beginning of the read
# TRAILING:15 cuts the base pairs at the end of the sequences that are below a score of 15
# ILLUMINACLIP is calling a file containing Nextera PE sequences that are part of those provided with the Trimmomatic program as well as sequences determined to be contaminants of RNA primers and Index sequences
# MINLEN:36 discards reads that are less than 36 base pairs in length

java -jar trimmomatic-0.36.jar PE XBOTT_20170717_K00134_IL100091004_CGTACTAG-TCTTACGC-S2_L008_R1.fastq.gz XBOTT_20170717_K00134_IL100091004_CGTACTAG-TCTTACGC-S2_L008_R2.fastq.gz Sample2_forward_paired.fq.gz Sample2_forward_unpaired.fq.gz Sample2_reverse_paired.fq.gz Sample2_reverse_unpaired.fq.gz HEADCROP:8 TRAILING:15 ILLUMINACLIP:NexteraPE_BaltAdaptSeq.fa:2:30:10 MINLEN:36

# This is just a clean up command, moving the 4 output files into its own directory

mv Sample2_forward_paired.fq.gz Sample2_forward_unpaired.fq.gz Sample2_reverse_paired.fq.gz Sample2_reverse_unpaired.fq.gz -t Sample2_trimmed
