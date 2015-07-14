#!/usr/bin/perl -w

use strict;

open my $file, '<', 'RXN.orphanProducts';
open  my $file2, '<', 'RXN.orphanSubstrates';
open my $out, '>>', 'RXN.exchange';
my @rxn;

while (my $RXN = <$file>) {
  chomp($RXN);
  my @names = split(/\[/, $RXN);
  push(@rxn, $names[0]);
}

while (my $RXN2 = <$file2>) {
  chomp($RXN2);
  my @names2 = split(/\[/, $RXN2);
  push(@rxn, $names2[0]);
}

@rxn = sort @rxn;

foreach (@rxn) {
  print "$_\n"
}
