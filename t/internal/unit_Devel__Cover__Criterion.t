use strict;
use warnings;

use Test::More;
use Devel::Cover::Criterion;

my $testCount;
plan tests => $testCount;

note( 'Starting unit tests for Devel::Cover::Criterion' );

=start template

note( '...FUNCTION()' );
{
    my $pad = [];
    Devel::Cover::Criterion::pad( $pad );
    pass( "I Passed once" );
    BEGIN { $testCount += 1 }
}
{
    my $pad = [];
    Devel::Cover::Criterion::pad( $pad );
    pass( "I Passed twice" );
    BEGIN { $testCount += 1 }
}

=cut

note( '...criterion()' );
{
    my $results = eval { Devel::Cover::Criterion::criterion __FILE__ };
    if (! $@ or $results eq __FILE__) {
	fail( "criterion() confessed not being overridden" );
	diag( "  \$@ = '$@',\n" );
	diag( "  \$results = '$results'" );
    }
    else {
	pass( "criterion confessed not being overridden" );
    }
    BEGIN { $testCount += 1 }
}

my @todoTests;
BEGIN {
    @todoTests = qw(
        coverage
        information
        covered
        total
        percentage
        error
        text
        values
        calculate_percentage
        aggregate
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
