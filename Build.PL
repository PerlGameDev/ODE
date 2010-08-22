use strict;
use warnings;
use Module::Build;
use Alien::ODE;

my $builder = Module::Build->new(
    module_name         => 'ODE',
    license             => 'lgpl',
    dist_author         => q{Kartik Thakore <thakore.kartik@CPAN.org>},
    dist_version_from   => 'lib/ODE.pm',
    build_requires => {
        'Test::More' => 0,
	'Alien::ODE' => 0
    },
    config_requires => {
        'Test::More' => 0,
	'Alien::ODE' => 0
    },
    add_to_cleanup      => [ 'ODE-*' ],
    create_makefile_pl => 'traditional',
    c_source 	=> 'src',    
    extra_linker_flags => Alien::ODE->config('libs').' -lstdc++',
    extra_compiler_flags => Alien::ODE->config('cflags'),
	
);

$builder->create_build_script();
