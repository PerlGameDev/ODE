package ODE::Objects::World;
use strict;
use warnings;
use vars qw(@ISA);
require DynaLoader;
our @ISA = qw(DynaLoader);

bootstrap ODE::Objects::World;

1;

__END__

=head1 NAME

ODE::Objects::World - Container for Rigid Bodies and Joints

=head1 SYNOPSIS

  use ODE::Objects::World;

  my $world = ODE::Objects::World::create();

=head1 METHODS

=head2 create()

Create a new, empty world and return its ID number.

=head2 set_gravity( $world, $x, $y, $z )

Set the world's global gravity vector. In the SI units the Earth's
gravity vector would be (0, 0, -9.81), assuming that +z is up. The
default is no gravity, i.e. (0, 0, 0).

=head2 get_gravity( $world )

Get the world's global gravity vector.

=head2 set_erp( $world, $erp )

Set the global ERP value, that controls how much error correction is
performed in each time step. Typical values are in the range 0.1 - 0.8.
The default is 0.2.

=head2 get_erp( $world )

Get the global ERP value.

=head2 set_cfm( $world, $cfm )

Set the global CFM (constraint force mixing) value. Typical values are
in the range 10e-9 - 1. The default is 10e-5 if single precision is
being used, or 10e-10 if double precision is being used.

=head2 get_cfm( $world )

Get the global CFM (constraint force mixing) value.

=head2 step( $world, $stepsize )

Step the world. This uses a "big matrix" method that takes time on the
order of m**3 and memory on the order of m**2, where m is the total
number of constraint rows.

For large systems this will use a lot of memory and can be very slow,
but this is currently the most accurate method.

=head2 quick_step( $world, $stepsize )

Step the world. This uses an iterative method that takes time on the
order of m*N and memory on the order of m, where m is the total number
of constraint rows and N is the number of iterations.

For large systems this is a lot faster than dWorldStep, but it is less
accurate.

QuickStep is great for stacks of objects especially when the
auto-disable feature is used as well. However, it has poor accuracy for
near-singular systems. Near-singular systems can occur when using
high-friction contacts, motors, or certain articulated structures. For
example, a robot with multiple legs sitting on the ground may be
near-singular.

There are ways to help overcome QuickStep's inaccuracy problems:


=over 4

=item *

Increase CFM.

=item *

Reduce the number of contacts in your system (e.g. use the minimum
number of contacts for the feet of a robot or creature).

=item *

Don't use excessive friction in the contacts.

=item *

Use contact slip if appropriate

=item *

Avoid kinematic loops (however, kinematic loops are inevitable in legged
creatures).

=item *

Don't use excessive motor strength.

=item *

Use force-based motors instead of velocity-based motors.

=back

Increasing the number of QuickStep iterations may help a little bit, but
it is not going to help much if your system is really near singular.

=head1 ACKNOWLEDGEMENTS

Documentation almost taken verbatim from
L<ODE's|http://ode-wiki.org/wiki/index.php?title=Manual:_World>.

=head1 AUTHORS

See L<ODE/AUTHORS>.

=head1 COPYRIGHT AND LICENSE

See L<ODE/COPYRIGHT AND LICENSE>.

