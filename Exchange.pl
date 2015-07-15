#!/usr/bin/perl -w

use strict;
use Data::Dumper;

my @lines = ();

foreach (0..$#ARGV) {
  open my $IN, "< $ARGV[$_]";
  while (my $line = <$IN>) {
    chomp;
    my @comp = split(/\[/,$line);
    push @lines, $comp[0];
  }
}
print $_."\n" foreach (@lines);
