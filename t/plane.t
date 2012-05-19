#!perl
use strict;
use warnings;
use Test::More;
use ODE::Collision::Space;
use ODE::Collision::Plane;

can_ok( 'ODE::Collision::Plane', qw( create_plane set_params get_params ) );

my $space = ODE::Collision::Space::simple_space_create();

# params (a, b, c, d) where (a, b, c) is a unit vector
my @params = ( 0.3, 0.4, undef, 0.6 );
$params[2] = sqrt( 1 - $params[0] * $params[0] - $params[1] * $params[1] );

my $plane = ODE::Collision::Plane::create_plane( $space, @params );
ok( $plane, 'create_plane' );

my @_params = ODE::Collision::Plane::get_params($plane);
cmp_ok( abs( $_params[0] - $params[0] ), '<', 1e-5, 'get_params a' );
cmp_ok( abs( $_params[1] - $params[1] ), '<', 1e-5, 'get_params b' );
cmp_ok( abs( $_params[2] - $params[2] ), '<', 1e-5, 'get_params c' );
cmp_ok( abs( $_params[3] - $params[3] ), '<', 1e-5, 'get_params d' );

done_testing();

