#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

exit 1 unless @ARGV;
my $emoji = ":$ARGV[0]:";
print join ' ', $emoji, map { "$emoji:skin-tone-$_:" } 2..6;

