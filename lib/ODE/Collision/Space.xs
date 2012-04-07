#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <ode/ode.h>

MODULE = ODE::Collision::Space		PACKAGE = ODE::Collision::Space		PREFIX = ocsp_

dSpaceID
ocsp_simple_space_create( ... )
	CODE:
		dSpaceID parent = 0;
		if ( items > 1 )
			parent = (dSpaceID)SvIV( ST(1) );
		RETVAL = dSimpleSpaceCreate(parent);
	OUTPUT:
		RETVAL

void
ocsp_DESTROY( space )
		dSpaceID space
	CODE:
		dSpaceDestroy( space );

