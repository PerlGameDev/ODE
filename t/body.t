#!perl -T
use strict;
use warnings;
use Test::More;
use ODE::Objects::World;
use ODE::Objects::Body;

can_ok( 'ODE::Objects::Body', qw( create set_position get_position ) );

my $world = ODE::Objects::World::create();

my $body = ODE::Objects::Body::create($world);
ok( $body, 'create' );

my @position = ( 1, 2, 3 );

ODE::Objects::Body::set_position( $body, @position );

my @_position = ODE::Objects::Body::get_position($body);
cmp_ok( abs( $_position[0] - $position[0] ), '<', 1e-5, 'get_position x' );
cmp_ok( abs( $_position[1] - $position[1] ), '<', 1e-5, 'get_position y' );
cmp_ok( abs( $_position[2] - $position[2] ), '<', 1e-5, 'get_position z' );

done_testing();

