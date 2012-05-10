#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <ode/ode.h>

MODULE = ODE::Collision::Geom		PACKAGE = ODE::Collision::Geom		PREFIX = ocg_

void
ocg_set_body( geom, body )
		dGeomID geom
		dBodyID body
	CODE:
		dGeomSetBody( geom, body );

