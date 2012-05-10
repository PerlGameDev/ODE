#!perl
use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw/
        ODE
        ODE::Collision::Box
        ODE::Collision::Plane
        ODE::Collision::Space
        ODE::Collision::Sphere
        ODE::Objects::Body
        ODE::Objects::World
        /;

    for (@modules) {
        use_ok($_) or BAIL_OUT("Failed to load $_");
    }
}

done_testing();

