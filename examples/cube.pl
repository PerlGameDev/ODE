#!perl
use strict;
use warnings;
use SDL;
use SDLx::App;
use OpenGL qw(:all);
use ODE::Objects::World;
use ODE::Objects::Body;

my ( $width, $height ) = ( 640, 480 );

my $world = ODE::Objects::World::create();

ODE::Objects::World::set_gravity( $world, 0, -10, 0 );

my $body = ODE::Objects::Body::create($world);

ODE::Objects::Body::set_position( $body, 0, 0, -900 );

my $fps      = 60;
my $timestep = 1 / $fps;

my $app = SDLx::App->new(
    title  => 'ODE - Cube',
    width  => $width,
    height => $height,
    dt     => $timestep,
    min_t  => $timestep,
    delay  => $timestep * 900,
    gl     => 1,
    eoq    => 1,
);

glViewport( 0, 0, $width, $height );

glMatrixMode(GL_PROJECTION);
glLoadIdentity();
glFrustum( -$width / 2, $width / 2, -$height / 2, $height / 2, 800, 1000 );

glMatrixMode(GL_MODELVIEW);
glLoadIdentity();

glEnable(GL_LIGHTING);
glEnable(GL_LIGHT0);
glEnable(GL_NORMALIZE);
glEnable(GL_CULL_FACE);

glLightModelfv_p( GL_LIGHT_MODEL_AMBIENT, 0.2, 0.2, 0.2, 1.0 );
glShadeModel(GL_SMOOTH);

glLightfv_p( GL_LIGHT0, GL_AMBIENT,  0.1, 0.1,  0.1,  1 );
glLightfv_p( GL_LIGHT0, GL_DIFFUSE,  0.5, 0.5,  0.5,  1 );
glLightfv_p( GL_LIGHT0, GL_SPECULAR, 0.8, 0.8,  0.8,  1 );
glLightfv_p( GL_LIGHT0, GL_POSITION, 200, 300, -800, 1 );

$app->add_show_handler(
    sub {
        glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

        draw_cube();

        ODE::Objects::World::step( $world, $timestep );

        $app->sync();
    }
);

$app->run();

sub draw_cube {
    glMaterialfv_p( GL_FRONT, GL_AMBIENT,  0,   0,   1,   1 );
    glMaterialfv_p( GL_FRONT, GL_DIFFUSE,  0.7, 0.7, 0.7, 1.0 );
    glMaterialfv_p( GL_FRONT, GL_SPECULAR, 1,   1,   1,   1 );
    glMateriali( GL_FRONT, GL_SHININESS, 120 );

    glLoadIdentity();

    my $position = ODE::Objects::Body::get_position($body);

    glTranslatef(@$position);

    my @indices = qw(
        4 5 6 7
        1 2 6 5
        0 1 5 4
        0 3 2 1
        0 4 7 3
        2 3 7 6
    );

    my @vertices = (
        [ -1, -1, -1 ],
        [ 1,  -1, -1 ],
        [ 1,  1,  -1 ],
        [ -1, 1,  -1 ],
        [ -1, -1, 1 ],
        [ 1,  -1, 1 ],
        [ 1,  1,  1 ],
        [ -1, 1,  1 ]
    );

    glBegin(GL_QUADS);

    for my $face ( 0 .. 5 ) {
        for my $vertex ( 0 .. 3 ) {
            my $index  = $indices[ 4 * $face + $vertex ];
            my $coords = $vertices[$index];
            glNormal3d(@$coords);
            glVertex3d( map { $_ * 20 } @$coords );
        }
    }

    glEnd();
}

