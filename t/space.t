#!perl
use strict;
use warnings;
use Test::More;
use ODE::Collision::Space;

can_ok( 'ODE::Collision::Space', qw( simple_space_create ) );

my $space = ODE::Collision::Space::simple_space_create();

ok( $space, 'simple_space_create' );

done_testing();

