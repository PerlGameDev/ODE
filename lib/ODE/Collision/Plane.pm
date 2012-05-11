package ODE::Collision::Plane;
use strict;
use warnings;
use vars qw(@ISA);
require DynaLoader;
our @ISA = qw(DynaLoader);

bootstrap ODE::Collision::Plane;

1;

__END__

=head1 NAME

ODE::Collision::Plane - Plane Geometry for Collision Detection

=head1 SYNOPSIS

  use ODE;
  use ODE::Collision::Plane;

  my $plane = ODE::Collision::Plane::create_plane( $space, $a, $b, $c, $d );

=head1 METHODS

=head2 create_plane( $space, $a, $b, $c, $d )

Create a plane geom of the given parameters, and return its ID. If space
is nonzero, insert it into that space. The plane equation is
C<a*x+b*y+c*z = d> The plane's normal vector is (a, b, c), and it must
have length 1. Planes are non-placeable geoms. This means that, unlike
placeable geoms, planes do not have an assigned position and rotation.
This means that the parameters (a, b, c, d) are always in global
coordinates. In other words it is assumed that the plane is always part
of the static environment and not tied to any movable object.

=head2 set_params( $plane, $a, $b, $c, $d )

Set the parameters of the given plane.

=head2 get_params( $a, $b, $c, $d )

Return the parameters of the given plane.

=head1 ACKNOWLEDGEMENTS

Documentation almost taken verbatim from
L<ODE's|http://ode-wiki.org/wiki/index.php?title=Manual:_Collision_Detection#Plane_Class>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.

