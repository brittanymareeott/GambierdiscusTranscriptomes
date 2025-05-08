#!/usr/bin/perl
use strict;

# THIS IS NOT MY SCRIPT AND THUS I SHOULD NOT RECEIVE ANY CREDIT FOR IT
# THIS SCRIPT WAS MADE BY NIEL INFANTE (AMINFANTE@hsc.wvu.edu) at WVU AND SHOULD RECEIVE CREDIT FOR ITS USE

# Script to count number of reads to each contig in sam file.
# Only counts reads that have mapped properly.

open (inFile, $ARGV[0]) || die "Can't open input $!\n";
open (oFile, ">$ARGV[1]") || die "Can't open output $!\n";
my %counts = ();

while (my $line = <inFile>){
    if ($line =~ /^@\w+\s+SN:(\w+)\s+/){
	$counts{$1} = 0;
    } else {    
	my @a = split(/\t/,$line);
	$counts{$a[2]}++ if (countThisRead($a[1]));
    }
}

close inFile;

foreach my $contig (sort keys %counts){
    print oFile "$contig\t$counts{$contig}\n";
}

sub countThisRead{
    my $bf = shift;

    if ($bf & 4){  # Read unmapped
	return 0;
    }

    if ($bf & 8){  # Mate unmapped
	return 0;
    }
#    if ($bf & 128){  # Second read of pair
#	return 0;
 #   }

    if ($bf & 256){  # Read mapped to multiple places
	return 0;
    }

    if ($bf & 2){  # Mapped as proper pair
	return 1;
    }

    return 0;
}
