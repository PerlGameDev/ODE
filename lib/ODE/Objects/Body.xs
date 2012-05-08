#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

#include <ode/ode.h>

MODULE = ODE::Objects::Body			PACKAGE = ODE::Objects::Body			PREFIX = oob_

dBodyID
oob_create( world )
		dWorldID world
	CODE:
		RETVAL = dBodyCreate( world );
	OUTPUT:
		RETVAL

void
oob_DESTROY( body )
		dBodyID body
	CODE:
		dBodyDestroy( body );

void
oob_set_position( body, x, y, z )
		dBodyID body
		dReal x
		dReal y
		dReal z
	CODE:
		dBodySetPosition( body, x, y, z );

AV *
oob_get_position( body )
		dBodyID body
	CODE:
		dReal *p = dBodyGetPosition( body );
		RETVAL = ptr_to_av( p, 3 );
	OUTPUT:
		RETVAL

