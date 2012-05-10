#!perl
use strict;
use warnings;
use Test::More;
use ODE::Collision::Space;
use ODE::Collision::Sphere;

can_ok( 'ODE::Collision::Sphere',
    qw( create_sphere get_radius set_radius point_depth) );

#my $space = ODE::Space->foo .. Needed
my $space = ODE::Collision::Space::simple_space_create();

ok( my $sphere = ODE::Collision::Sphere::create_sphere( $space, 0.3 ),
    'creating sphere with radius 0.3' );

cmp_ok( abs( ODE::Collision::Sphere::get_radius($sphere) - 0.3 ),
    '<', 1e-5, 'get_radius got proper initialization value' );

ODE::Collision::Sphere::set_radius( $sphere, 0.7 ),
    pass('calling set_radius()');

cmp_ok( abs( ODE::Collision::Sphere::get_radius($sphere) - 0.7 ),
    '<', 1e-5, 'get_radius got new (changed) value' );

cmp_ok( ODE::Collision::Sphere::point_depth( $sphere, 0, 0, 0 ),
    '>', 0, 'points inside the sphere have a positive depth' );

cmp_ok( ODE::Collision::Sphere::point_depth( $sphere, 10, 10, 10 ),
    '<', 0, 'points outside the sphere have a negative depth' );

TODO: {
    local $TODO = "Can't do proper math at 4am";

    my $r     = 0.7;
    my $theta = 0;
    my $phi   = 0;

    my $x = $r * sin($theta) * cos($phi);
    my $y = $r * sin($theta) * sin($phi);
    my $z = $r * cos($theta);

    cmp_ok( ODE::Collision::Sphere::point_depth( $sphere, $x, $y, $z ),
        '<', 1e-5, 'points on the surface have a depth of zero' );
}

done_testing();

