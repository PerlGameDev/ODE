#!perl -T
use strict;
use warnings;
use Test::More;
use ODE::Objects::World;
use ODE::Objects::Body;

my $world_id = ODE::Objects::World::create();

my $body_id = ODE::Objects::Body::create($world_id);

my @position = ( 1, 2, 3 );

ODE::Objects::Body::set_position( $body_id, @position );

cmp_ok( abs( ODE::Objects::Body::get_position($body_id)->[0] - $position[0] ),
    '<', 1e-5, 'get_position x' );
cmp_ok( abs( ODE::Objects::Body::get_position($body_id)->[1] - $position[1] ),
    '<', 1e-5, 'get_position y' );
cmp_ok( abs( ODE::Objects::Body::get_position($body_id)->[2] - $position[2] ),
    '<', 1e-5, 'get_position z' );

done_testing();

