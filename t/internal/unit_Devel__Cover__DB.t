use strict;
use warnings;

use Test::More;
use Devel::Cover::DB;

my $testCount;
plan tests => $testCount;

note( 'Starting unit tests for Devel::Cover::DB' );

note( '...trimmed_file()' );
{
    my @tests;

    BEGIN {
	@tests = (
	    {
		name => 'string less than minimum size',
		flen => 19, 
		len  => 20,
		good => qr{^x{19}$},
	    },
	    {
		name => 'string of maximum size',
		flen => 20, 
		len  => 20,
		good => qr{^x{20}$},
	    },
	    {
		name => 'string larger than maximum size',
		flen => 21, 
		len  => 20,
		good => qr{^\.\.\.x{17}$},
	    },
	    );
	$testCount += @tests;
    }

    for my $test ( @tests ) {
	my $test_string = 'x' x $test->{flen};

	my $result = Devel::Cover::DB::trimmed_file( $test_string, $test->{len} );

	my $test_name = sprintf( "%s( %s, %d ): %s\n",
				 'trimmed_file',
				 $test_string,
				 $test->{len},
				 $test->{name},
	    );
	if ( $result =~ $test->{good} ) {
	    pass( $test_name );
	}
	else {
	    fail( $test_name );
	    diag( "  \$result = $result\n" );
	    diag( "  not like " . $test->good );
	}
    }
}

my @todoTests;
BEGIN {
    @todoTests = qw(
        new
	criteria
	criteria_short
	all_criteria
	all_criteria_short
	read
	write
	delete
	merge_runs
	validate_db
	exists
	is_valid
	collected
	merge
	summary
	calculate_summary
	print_summary
	add_statement
	add_time
	add_branch
	add_condition
	add_pod
	add_subroutine
	uncoverable_files
	uncoverable
	add_uncoverable
	delete_uncoverable
	clean_uncoverable
	uncoverable_comments
	objectify_cover
	cover
	runs
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
