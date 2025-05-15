#!/bin/sh
# This script runs Trimmomatic on raw Gambierdiscus reads

# To run this script, ensure that you are in the folder containing the PE read files and move the trimmomatic.jar file into the same folder (otherwise you will need to add their paths.

# Command (unix): $ nohup nice sh Trim_v1.sh &

cd ~/Gambierdiscus_Pooled_Lib/ILLUMINA_DATA/

mkdir Sample9_trimmed

# This command calls the trimmomatic jar file, utilizing paired-end (PE) forward and reverse reads for each sample
# It outputs 4 files: one each for forward paired and unpaired, as well as reverse paired and unpaired
# Unpaired indicates that it could not find its counterpart in the opposite file (e.g. forward could not find reverse pair)
# HEADCROP:8 cuts the first 8 bp at the beginning of the read; TRAILING:15 cuts base pairs at the end of the sequence that are below a score of 15
java -jar trimmomatic-0.36.jar PE XBOTT_20170717_K00134_IL100091004_AGGCAGAA-AGAGGATA-S9_L008_R1.fastq.gz XBOTT_20170717_K00134_IL100091004_AGGCAGAA-AGAGGATA-S9_L008_R2.fastq.gz Sample9_forward_paired.fq.gz Sample9_forward_unpaired.fq.gz Sample9_reverse_paired.fq.gz Sample9_reverse_unpaired.fq.gz HEADCROP:8 TRAILING:15

# This is just a clean up command, moving the 4 output files into its own directory
mv Sample9_forward_paired.fq.gz Sample9_forward_unpaired.fq.gz Sample9_reverse_paired.fq.gz Sample9_reverse_unpaired.fq.gz -t Sample9_trimmed
