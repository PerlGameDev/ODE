use strict;
use warnings;
use Test::Most 'bail';

BEGIN {
	my @modules = qw /
		ODE
		ODE::Collision::Box
		ODE::Collision::Plane
		ODE::Collision::Space
		ODE::Collision::Sphere
		ODE::Objects::Body
		ODE::Objects::World
		/;
	plan tests => scalar @modules;

	use_ok $_ foreach @modules;
}
