use strict;
use warnings;

use Test::More;

use Devel::Cover;

my $testCount;
plan tests => $testCount;

{
    no warnings 'redefine';
    local *Devel::Cover::_initialised = sub { undef };
    local *Devel::Cover::check_files  = sub { die "Made it past the return" };

    my $subReturn;
    my $evalReturn = eval { $subReturn = Devel::Cover::check; 1; };

    my $success = ( $@ eq '' ) && ( ! defined $subReturn ) && ( $evalReturn == 1 );

    ok( $success, 'check returns immediately if not initialised' );

    BEGIN { $testCount += 1 }
}
