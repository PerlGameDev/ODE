#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <ode/ode.h>

MODULE = ODE::Collision::Sphere 		PACKAGE = ODE::Collision::Sphere		PREFIX = ocs_


dGeomID
ocs_create_sphere ( space, radius )
	dSpaceID space
	dReal radius
	PREINIT:
		char *CLASS = "ODE::Collision::Sphere";
	CODE:
		RETVAL = dCreateSphere( space, radius );
	OUTPUT:
		RETVAL


dReal
ocs_get_radius( sphere )
	dGeomID sphere
	CODE:
		RETVAL = dGeomSphereGetRadius( sphere );
	OUTPUT:
		RETVAL


void
ocs_set_radius ( sphere, radius )
	dGeomID sphere
	dReal radius
	CODE:
		dGeomSphereSetRadius ( sphere, radius)


dReal
ocs_point_depth ( sphere, x, y, z )
	dGeomID sphere
	dReal x
	dReal y
	dReal z
	CODE:
		RETVAL = dGeomSpherePointDepth ( sphere, x, y, z );
	OUTPUT:
		RETVAL


