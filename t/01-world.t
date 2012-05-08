#!perl -T
use strict;
use warnings;
use Test::More;
use ODE::Objects::World;

my $world_id = ODE::Objects::World::create();

my @gravity = ( 1, 2, 3 );
ODE::Objects::World::set_gravity( $world_id, @gravity );

cmp_ok( abs( ODE::Objects::World::get_gravity($world_id)->[0] - $gravity[0] ),
    '<', 1e-5, 'get_gravity x' );
cmp_ok( abs( ODE::Objects::World::get_gravity($world_id)->[1] - $gravity[1] ),
    '<', 1e-5, 'get_gravity y' );
cmp_ok( abs( ODE::Objects::World::get_gravity($world_id)->[2] - $gravity[2] ),
    '<', 1e-5, 'get_gravity z' );

done_testing();

