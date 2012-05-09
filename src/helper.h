#ifndef ODE_PERL_HELPER_H
#define ODE_PERL_HELPER_H

#include <ode/ode.h>

AV *dv3_to_av( dVector3 v )
{
	AV* array_ref = newAV();
	av_push( array_ref, newSVnv(v[0]) );
	av_push( array_ref, newSVnv(v[1]) );
	av_push( array_ref, newSVnv(v[2]) );
	sv_2mortal( (SV *)array_ref );
	return array_ref;
}

AV *dv4_to_av( dVector4 v )
{
	AV* array_ref = newAV();
	av_push( array_ref, newSVnv(v[0]) );
	av_push( array_ref, newSVnv(v[1]) );
	av_push( array_ref, newSVnv(v[2]) );
	av_push( array_ref, newSVnv(v[3]) );
	sv_2mortal( (SV *)array_ref );
	return array_ref;
}

AV *ptr_to_av( dReal *p, int count )
{
	AV* array_ref = newAV();
	int i;
	for ( i = 0; i < count; i++ )
	{
		av_push( array_ref, newSVnv(p[i]) );
	}
	sv_2mortal( (SV *)array_ref );
	return array_ref;
}

#endif
