use Test::More;

use ODE::Collision::Space;
use ODE::Collision::Box;

#my $spaceID = ODE::Space->foo .. Needed
my $spaceID = ODE::Collision::Space::simple_space_create();

ok( my $box = ODE::Collision::Box::create_box( $spaceID, 0.3, 0.4, 0.5 ),
    'creating box 0.3 x 0.4 x 0.5' );

can_ok( ODE::Collision::Box, qw(set_lengths get_lengths) );

my $lengths = ODE::Collision::Box::get_lengths($box);
cmp_ok( abs( $lengths->[0] - 0.3 ),
    '<', 1e-5, 'get_lengths got proper initialization value (x)' );
cmp_ok( abs( $lengths->[1] - 0.4 ),
    '<', 1e-5, 'get_lengths got proper initialization value (y)' );
cmp_ok( abs( $lengths->[2] - 0.5 ),
    '<', 1e-5, 'get_lengths got proper initialization value (z)' );

done_testing();
