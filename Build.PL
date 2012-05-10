use strict;
use warnings;
use Module::Build;
use Alien::ODE;

my $builder = Module::Build->new(
    module_name        => 'ODE',
    dist_abstract      => '3D Physics Library',
    license            => 'lgpl',
    dist_author        => q{Kartik Thakore <kthakore@CPAN.org>},
    dist_version_from  => 'lib/ODE.pm',
    configure_requires => {
        'Module::Build' => 0,
        'Alien::ODE'    => 0,
    },
    build_requires => {
        'Test::More' => 0,
        'Alien::ODE' => 0,
    },
    add_to_cleanup       => ['ODE-*'],
    c_source             => 'src',
    extra_linker_flags   => Alien::ODE->config('libs') . ' -lstdc++',
    extra_compiler_flags => Alien::ODE->config('cflags'),
    meta_merge           => {
        resources => {
            bugtracker => 'https://github.com/PerlGameDev/ODE/issues',
            repository => 'https://github.com/PerlGameDev/ODE',
        },
    },
);

$builder->create_build_script();

