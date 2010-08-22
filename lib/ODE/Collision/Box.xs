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


