use strict;
use warnings;
use Test::Most 'bail';

BEGIN {
	my @modules = qw /
		ODE
		ODE::Collision::Sphere
		ODE::Collision::Box
		ODE::Collision::Space
		ODE::Objects::World
		ODE::Objects::Body
		/;
	plan tests => scalar @modules;

	use_ok $_ foreach @modules;
}
