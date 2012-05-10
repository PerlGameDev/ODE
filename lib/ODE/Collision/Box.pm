package ODE::Collision::Box;
use strict;
use warnings;
use vars qw(@ISA);
require DynaLoader;
our @ISA = qw(DynaLoader);

bootstrap ODE::Collision::Box;

1;

__END__

=head1 NAME

ODE::Collision::Box - Box Geometry for Collision Detection

=head1 SYNOPSIS

  use ODE;
  use ODE::Collision::Box;

  my $box = ODE::Collision::Box::create_box( $space, 3, 2.1, 4 );

=head1 METHODS

=head2 create_box( $space, $lx, $ly, $lz )

B<Parameters:>

$space - a space to contain the new geom. May be null.

$lx - the length of the box along the X axis

$ly - the length of the box along the Y axis

$lz - the length of the box along the Z axis

Returns a new box geometry. The point of reference for coordinates is
its center.

=head2 get_lengths($box)

  my ($lx, $ly, $lz) = ODE::Collision::Box::get_lengths($box);

Get the side lengths of a box.

=head2 set_lengths($box, $lx, $ly, $lz)

  ODE::Collision::Box::set_lengths($box, $lx, $ly, $lz);

B<Parameters:>

$lx - the length of the box along the X axis

$ly - the length of the box along the Y axis

$lz - the length of the box along the Z axis

Set the side lengths of the given box. Returns nothing.

=head1 ACKNOWLEDGEMENTS

Documentation almost taken verbatim from
L<ODE's|http://opende.sourceforge.net/docs/group__collide__box.html>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.

