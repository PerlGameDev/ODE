package ODE::Objects::Body;
use strict;
use warnings;
use vars qw(@ISA);
require DynaLoader;
our @ISA = qw(DynaLoader);

bootstrap ODE::Objects::Body;

1;

__END__

=head1 NAME

ODE::Collision::Body - Rigid Body

=head1 SYNOPSIS

  use ODE::Objects::Body;

  my $body = ODE::Objects::Body::create( $world )

=head1 METHODS

=head2 create( $world )

Create a body in the given world with default mass parameters at
position (0, 0, 0). Return its ID.

=head2 set_position( $body, $x, $y, $z )

Set the position of the body.

=head2 get_position( $body )

Get the position of the body.

=head1 ACKNOWLEDGEMENTS

Documentation almost taken verbatim from
L<ODE's|http://ode-wiki.org/wiki/index.php?title=Manual:_Rigid_Body_Functions>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.

