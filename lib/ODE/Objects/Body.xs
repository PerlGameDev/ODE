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

dReal *
oob_get_position( body )
		dBodyID body
	PREINIT:
		U32 size_RETVAL;
	CODE:
		size_RETVAL = 3;
		RETVAL = dBodyGetPosition( body );
	OUTPUT:
		RETVAL
	CLEANUP:
		XSRETURN(size_RETVAL);

