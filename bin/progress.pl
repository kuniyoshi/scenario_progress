#!/usr/bin/env perl
use 5.10.0;
use utf8;
use strict;
use warnings;
use open qw( :utf8 :std );
use Data::Dumper;
use List::Util qw( sum );
use Time::Piece qw( localtime );

chomp( my @lines = <> );

my %result = count( @lines );
say join "\t", ( localtime->strftime( "%F %H:%M" ), @result{ qw( words lines paragraphs comments ) } );

exit;

sub count {
    my @lines = @_;
    my @comments = grep { m{\A // }msx } @lines;

    my $content = join "\n", grep { !m{\A // }msx } @lines;
    $content =~ s{\n+}{\n\n}g;

    my @scenario_lines = split m{\n}, $content;

    my %result = (
        lines => scalar( @scenario_lines ),
        words => sum( map { length } @scenario_lines ),
        paragraphs => scalar( grep { m{\A \z}msx } @scenario_lines ) + 1,
        comments => scalar( @comments ),
    );

    return %result;
}
