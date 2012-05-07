package ODE::Collision::Space;
use strict;
use warnings;
use vars qw(@ISA);
require DynaLoader;
our @ISA = qw(DynaLoader);

bootstrap ODE::Collision::Space;

1;
__END__

=head1 NAME

ODE::Collision::Space - Defines spaces in ODE

=head1 SYNOPSIS

  use ODE;
  use ODE::Collision::Space;

  my $space = ODE::Collision::Space::simple_space_create();

=head1 METHODS

=head2 simple_space_create( $parent )

B<Parameters:>

$parent - the parent space 

Creates a spaceID to use with collisons. 

=head1 ACKNOWLEDGEMENTS

Documentation from L<ODE's|http://ode-wiki.org/wiki/index.php?title=Manual:_Collision_Detection#Space_functions>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.


