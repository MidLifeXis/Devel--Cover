use strict;
use warnings;

use Test::More;
use Devel::Cover::Branch;

my $testCount;
plan tests => $testCount;

note( 'Starting unit tests for Devel::Cover::Branch' );

my @todoTests;
BEGIN {
    @todoTests = qw(
        pad
        uncoverable
        coveed
        total
        value
        values
        text
        criterion
        percentage
        error
        calculate_summary
    );
    $testCount += scalar( @todoTests );
}
for my $method ( @todoTests ) {
    note( "...$method()" );
    {
      TODO:
        {
            local $TODO = "Need to understand $method()";
            fail( 'Not yet implemented' );
        }
    }
}
