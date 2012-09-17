use strict;
use warnings;

use Test::More;
use Devel::Cover::Branch;

my $testCount;
plan tests => $testCount;

note( 'Starting unit tests for Devel::Cover::Branch' );

note( '...pad()' );
{
    my $pad = [];
    Devel::Cover::Branch::pad( $pad );
    ok( $pad &&
        ref( $pad ) &&
        ref( $pad ) eq 'ARRAY' &&
        $pad->[0] &&
        ref( $pad->[0] ) &&
        ref( $pad->[0] ) eq 'ARRAY' &&
        $pad->[0][0] == 0 &&
        $pad->[0][1] == 0,
        'pad given empty arrayref returns properly initialized data',
        );
    BEGIN { $testCount += 1 }
}

{
    my $pad = [[]];
    Devel::Cover::Branch::pad( $pad );
    ok( $pad &&
        ref( $pad ) &&
        ref( $pad ) eq 'ARRAY' &&
        $pad->[0] &&
        ref( $pad->[0] ) &&
        ref( $pad->[0] ) eq 'ARRAY' &&
        $pad->[0][0] == 0 &&
        $pad->[0][1] == 0,
        'pad given arrayref where element 0 is an empty arrayref returns properly initialized data',
        );
    BEGIN { $testCount += 1 }
}

{
    my $pad = [[1,1]];
    Devel::Cover::Branch::pad( $pad );
    ok( $pad &&
        ref( $pad ) &&
        ref( $pad ) eq 'ARRAY' &&
        $pad->[0] &&
        ref( $pad->[0] ) &&
        ref( $pad->[0] ) eq 'ARRAY' &&
        $pad->[0][0] == 1 &&
        $pad->[0][1] == 1,
        'pad given arrayref where element 0 is already set returns properly initialized data',
        );
    BEGIN { $testCount += 1 }
}

note( '...criterion()' );
{
    my $pad = bless [], 'Devel::Cover::Branch';
    Devel::Cover::Branch::pad( $pad );

    my $expected = 'branch';
    my $actual   = Devel::Cover::Branch::criterion( $pad );
    is( $expected, $actual, "criterion gives an expected value" )
        or diag( "expected = '$expected', actual = '$actual'" );
    BEGIN { $testCount += 1 }
}

note( '...percentage()' );
{
    my $pad = bless [], 'Devel::Cover::Branch';
    Devel::Cover::Branch::pad( $pad );

    explain( $pad );
    my $expected = '  0';
    my $actual   = Devel::Cover::Branch::percentage( $pad );
    is( $expected, $actual, "percentage given fresh data returns 0" );
    BEGIN { $testCount += 1 }
}

{
    my $pad = bless [], 'Devel::Cover::Branch';
    Devel::Cover::Branch::pad( $pad );

    explain( $pad );
    my $expected = '  0';
    my $actual   = Devel::Cover::Branch::percentage( $pad );
    is( $expected, $actual, "percentage given fresh data returns 0" );
    BEGIN { $testCount += 1 }
}

my @todoTests;
BEGIN {
    @todoTests = qw(
        uncoverable
        coveed
        total
        value
        values
        text
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
