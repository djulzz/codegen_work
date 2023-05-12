/**
 * @file busDemo_Impl_Private.cpp
 */

#include "busDemo_Impl_Private.h"
#include "bus_definition.h"

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void busDemo_Impl_Private( double* input, bus_demo_t* busOut )
{
    busOut->E1 = 1.0;
    busOut->E2 = 2.0;
    busOut->E3 = 3.0;
    busOut->E4 = 4.0;
    return;
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
void busDemo_Impl( double* u1, bus_demo_t* __y1BUS )
{
    busDemo_Impl_Private( u1, __y1BUS );
    return;
}
