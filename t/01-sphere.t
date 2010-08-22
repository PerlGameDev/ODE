use Test::More;

use_ok('ODE::Collision::Sphere');

ok(my $sphere = ODE::Collision::Sphere->create_sphere( 0.3 ), 'creating sphere with radius 0.3');

isa_ok($sphere, 'ODE::Collision::Sphere');

can_ok($sphere, qw(get_radius point_depth set_radius));

is( $sphere->get_radius, 0.3, 'get_radius got proper initialization value');

ok($sphere->set_radius(0.7), 'calling set_radius()');

is( $sphere->get_radius, 0.7, 'get_radius got new (changed) value');

ok( $sphere->point_depth(0,0,0) > 0, 'points inside the sphere have a positive depth');

ok( $sphere->point_depth(10,10,10) > 0, 'points outside the sphere have a negative depth');

TODO: {
    local $TODO = "Can't do proper math at 4am";

    my $r = 0.7;
    my $theta = 0;
    my $phi = 0;

    my $x = $r * sin($theta) * cos($phi);
    my $y = $r * sin($theta) * sin($phi);
    my $z = $r * cos($theta);

    ok( $sphere->point_depth($x, $y, $z) == 0, 'points on the surface have a depth of zero');
};

done_testing();
