# Copyright 2001, Paul Johnson (pjcj@cpan.org)

# This software is free.  It is licensed under the same terms as Perl itself.

# The latest version of this software should be available from my homepage:
# http://www.pjcj.net

package T1;

my $y = 7;
$y++;

sub yy
{
    $y++;
}

sub zz
{
    my $x = shift;
    $x++;
}

1

__END__

=head2 yy

yy

=cut