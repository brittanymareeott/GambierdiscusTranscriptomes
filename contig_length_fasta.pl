#!/usr/bin/perl -w

#NOTE: THIS SCRIPT WAS NOT MADE BY BRITTANYMAREEOTT, BUT WAS MADE BY SEJ MODHA ON BIOSTARS.
#IF YOU USE THIS SCRIPT, PLEASE CREDIT THE ORIGINAL DEVELOPER, NOT ME.
#THE ORIGINAL LOCATION OF THIS SCRIPT IS: https://www.biostars.org/p/148815/
#SEJ MODHA'S PROFILE CAN BE FOUND HERE: https://www.biostars.org/u/9571/

#To use:
# $ ./contig_length_fasta.pl fastafile.fasta > fasta_lengths_out

use strict;
#contig_length_fasta.pl
my $largest = 0;

my $contig = '';

if (@ARGV != 1) {
        print "contig_length_fastq fasta\n\n" ;
        exit ;
}

my $filenameA = $ARGV[0];

open (IN, "$filenameA") or die "oops!\n" ;

        my $read_name = '' ;
        my $read_seq = '' ;

        while (<IN>) {
            if (/^>(\S+)/) {
                $read_name = $1 ;
                $read_seq = "" ;
                
                while (<IN>) {

                        if (/^>(\S+)/) {
                            
                            print "$read_name\t" . length($read_seq) . "\n" ;

                            $read_name = $1 ;
                            $read_seq = "" ;

                        }

                        else {
                            chomp ;
                            $read_seq .= $_ ;
                        }

                }

            }
        }

close(IN) ;

print "$read_name\t" . length($read_seq) . "\n" ;
