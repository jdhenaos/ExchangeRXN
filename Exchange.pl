#!/usr/bin/perl -w

use strict;
use Data::Dumper;

open my $lose, '>>', '.list';
open my $OUT, '>>', 'ExchangesRXN';
my @lines = ();

foreach (0..$#ARGV) {
  open my $IN, "< $ARGV[$_]";
  while (my $line = <$IN>) {
    my @comp = split(/\[/,$line);
    push @lines, $comp[0];
  }
}

print $lose $_."\n" foreach (@lines);
my @uniques = `sort .list | uniq`;

foreach my $x (@uniques) {
  chomp($x);
  print $OUT "\'EX_$x(e)\'\t\'$x exchange\'\t\'$x\[e\] <=> \'\t\'Exchange\'\t\'\'\n";
}

close $lose;
close $OUT;
