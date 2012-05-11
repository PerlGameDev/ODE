package ODE::Collision::Sphere;
use strict;
use warnings;
use vars qw(@ISA);
require DynaLoader;
our @ISA = qw(DynaLoader);

bootstrap ODE::Collision::Sphere;

1;

__END__

=head1 NAME

ODE::Collision::Sphere - Sphere Geometry for Collision Detection

=head1 SYNOPSIS

  use ODE;
  use ODE::Collision::Sphere;

  my $box = ODE::Collision::Sphere->create_sphere( $space, 42 );

=head1 METHODS

=head2 create_sphere( $space, $radius )

B<Parameters:>

$radius - the radius of the sphere

Creates a sphere geometry of the given radius, and returns it. The point
of reference for a sphere is its center.

=head2 set_radius( $sphere, $radius )

B<Parameters:>

$radius - the radius of the sphere

Set the radius of the sphere. Returns nothing.

=head2 get_radius( $sphere )

Get the radius of the sphere

=head2 point_depth( $sphere, $x, $y, $z )

B<Parameters:>

$x - the X coordinate of the point.

$y - the Y coordinate of the point.

$z - the Z coordinate of the point.

Calculates the depth of the a given point within a sphere, and returns
it. Points inside the sphere will have a positive depth, points outside
it will have a negative depth, and points on the surface will have a
depth of zero.

=head1 ACKNOWLEDGEMENTS

Documentation almost taken verbatim from
L<ODE's|http://opende.sourceforge.net/docs/group__collide__sphere.html>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.

