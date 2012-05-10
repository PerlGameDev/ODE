#!perl
use strict;
use warnings;
use Test::More;
use ODE::Collision::Space;
use ODE::Collision::Geom;
use ODE::Collision::Box;
use ODE::Objects::World;
use ODE::Objects::Body;

can_ok( 'ODE::Collision::Geom', qw( set_body ) );

my $space = ODE::Collision::Space::simple_space_create();

my $box = ODE::Collision::Box::create_box( $space, 1, 2, 3 );

my $world = ODE::Objects::World::create();

my $body = ODE::Objects::Body::create($world);

ODE::Collision::Geom::set_body( $box, $body );

done_testing();

