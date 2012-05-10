#!perl -T
use strict;
use warnings;
use Test::More;
use ODE::Objects::World;

can_ok( 'ODE::Objects::World', qw( create set_gravity get_gravity ) );

my $world = ODE::Objects::World::create();

my @gravity = ( 1, 2, 3 );
ODE::Objects::World::set_gravity( $world, @gravity );

cmp_ok( abs( ODE::Objects::World::get_gravity($world)->[0] - $gravity[0] ),
    '<', 1e-5, 'get_gravity x' );
cmp_ok( abs( ODE::Objects::World::get_gravity($world)->[1] - $gravity[1] ),
    '<', 1e-5, 'get_gravity y' );
cmp_ok( abs( ODE::Objects::World::get_gravity($world)->[2] - $gravity[2] ),
    '<', 1e-5, 'get_gravity z' );

done_testing();

