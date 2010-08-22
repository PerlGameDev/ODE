#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <ode/ode.h>

MODULE = ODE::Collision::Box 		PACKAGE = ODE::Collision::Box		PREFIX = ocb_


dGeomID
ocb_create_box ( space, lx, ly, lz )
	dSpaceID space
    dReal lx
    dReal ly
    dReal lz
	PREINIT:
		char *CLASS = "ODE::Collision::Box";
	CODE:
		RETVAL = dCreateBox ( space, lx, ly, lz );
	OUTPUT:
		RETVAL


void
ocb_set_lengths( box, lx, ly, lz )
	dGeomID box
	dReal lx
	dReal ly
	dReal lz
	CODE:
		dGeomBoxSetLengths( box, lx, ly, lz );

/*
dReal *
ocb_get_lengths( box )
	dGeomID box
	CODE:
		// make our destination vector
		dReal dVector3[4];
		dGeomBoxGetLengths( box, dVector3 );
		RETVAL = dVector3;
	OUTPUT:
		RETVAL
*/


