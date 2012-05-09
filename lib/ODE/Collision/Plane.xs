#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

#include <ode/ode.h>

MODULE = ODE::Collision::Plane		PACKAGE = ODE::Collision::Plane		PREFIX = ocp_

dGeomID
ocp_create_plane( space, a, b, c, d )
		dSpaceID space
		dReal a
		dReal b
		dReal c
		dReal d
	PREINIT:
		char *CLASS = "ODE::Collision::Plane";
	CODE:
		RETVAL = dCreatePlane( space, a, b, c, d );
	OUTPUT:
		RETVAL

void
ocp_set_params( plane, a, b, c, d )
		dGeomID plane
		dReal a
		dReal b
		dReal c
		dReal d
	CODE:
		dGeomPlaneSetParams( plane, a, b, c, d );

AV *
ocp_get_params( plane )
		dGeomID plane
	CODE:
		dVector4 params;
		dGeomPlaneGetParams( plane, params );
		RETVAL = dv4_to_av(params);
	OUTPUT:
		RETVAL

