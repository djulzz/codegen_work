/**
 * @file busDemo_Impl_Private.h
 */
#ifndef BUSDEMO_IMPL_PRIVATE_H
#define BUSDEMO_IMPL_PRIVATE_H

#include "bus_definition.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void busDemo_Impl( double* u1, bus_demo_t* __y1BUS );
void busDemo_Impl_Private( double* input, bus_demo_t* busOut );

#endif /* BUSDEMO_IMPL_PRIVATE_H defined */