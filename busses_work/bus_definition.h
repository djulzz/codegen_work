#ifndef RTW_HEADER_bus_definition_h_
#define RTW_HEADER_bus_definition_h_
#ifdef  MATLAB_MEX_FILE
#include "tmwtypes.h"
#else
typedef double real_T;
#endif

typedef struct {
  real_T E1;
  real_T E2;
  real_T E3;
  real_T E4;
} bus_demo_t;

#endif                                 /* RTW_HEADER_bus_definition_h_ */