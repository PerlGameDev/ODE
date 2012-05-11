#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"
#include "helper.h"

#include <ode/ode.h>

MODULE = ODE::Objects::World			PACKAGE = ODE::Objects::World			PREFIX = oow_

dWorldID
oow_create()
	CODE:
		RETVAL = dWorldCreate();
	OUTPUT:
		RETVAL

void
oow_DESTROY( world )
		dWorldID world
	CODE:
		dWorldDestroy( world );

void
oow_set_gravity( world, x, y, z )
		dWorldID world
		dReal x
		dReal y
		dReal z
	CODE:
		dWorldSetGravity( world, x, y, z );

AV*
oow_get_gravity( world )
		dWorldID world
	CODE:
		dVector3 gravity;
		dWorldGetGravity( world, gravity );
		RETVAL = dv3_to_av( gravity );
	OUTPUT:
		RETVAL


void
oow_set_erp( world, erp )
		dWorldID world
		dReal erp
	CODE:
		dWorldSetERP( world, erp );

dReal
oow_get_erp( world )
		dWorldID world
	CODE:
		RETVAL = dWorldGetERP( world );
	OUTPUT:
		RETVAL

void
oow_set_cfm( world, cfm )
		dWorldID world
		dReal cfm
	CODE:
		dWorldSetCFM( world, cfm );

dReal
oow_get_cfm( world )
		dWorldID world
	CODE:
		RETVAL = dWorldGetCFM( world );
	OUTPUT:
		RETVAL

int
oow_step( world, stepsize )
		dWorldID world
		dReal stepsize
	CODE:
		RETVAL = dWorldStep( world, stepsize );
	OUTPUT:
		RETVAL

int
oow_quick_step( world, stepsize )
		dWorldID world
		dReal stepsize
	CODE:
		RETVAL = dWorldQuickStep( world, stepsize );
	OUTPUT:
		RETVAL

