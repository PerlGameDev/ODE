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

=head2 set_params( $plane, $a, $b, $c, $d )

=head2 get_params( $a, $b, $c, $d )

=head1 ACKNOWLEDGEMENTS

Documentation almost taken verbatim from
L<ODE's|http://ode-wiki.org/wiki/index.php?title=Manual:_Collision_Detection#Plane_Class>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.

