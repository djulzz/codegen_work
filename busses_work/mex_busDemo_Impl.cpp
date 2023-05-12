#define S_FUNCTION_NAME  mex_busDemo_Impl
#define S_FUNCTION_LEVEL 2

#include "simstruc.h"

#include <string.h>
#include <stdlib.h>

#include "busDemo_Impl_Private.h"
#include "bus_definition.h"

#define IS_SIMULATION_TARGET(S) (ssRTWGenIsAccelerator(S) || ssIsRapidAcceleratorActive(S) || ssRTWGenIsModelReferenceSimTarget(S) || (ssGetSimMode(S)==SS_SIMMODE_NORMAL) || (ssGetSimMode(S)==SS_SIMMODE_SIZES_CALL_ONLY) || !((ssRTWGenIsCodeGen(S) || ssGetSimMode(S)==SS_SIMMODE_EXTERNAL) && GetRTWEnvironmentMode(S)==0))

// busDemo_Impl(*u1, *__y1BUS);
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static int_T GetRTWEnvironmentMode(SimStruct *S);

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static void mdlInitializeSizes(SimStruct *S)
{
    /* Flag for detecting standalone or simulation target mode */
    boolean_T isSimulationTarget = IS_SIMULATION_TARGET(S);

    /* Number of expected parameters */
    ssSetNumSFcnParams(S, 0);


    /* Set the number of work vectors */
    if (!IS_SIMULATION_TARGET(S)) {
        ssSetNumPWork(S, 0);
        if (!ssSetNumDWork(S, 0)) return;
    } else {
        ssSetNumPWork(S, 1);
        if (!ssSetNumDWork(S, 2)) return;

        /* Configure the dwork 1 (__dtSizeInfo) */
        ssSetDWorkDataType(S, 0, SS_INT32);
        ssSetDWorkUsageType(S, 0, SS_DWORK_USED_AS_DWORK);
        ssSetDWorkName(S, 0, "dtSizeInfo");
        ssSetDWorkWidth(S, 0, 2);
        ssSetDWorkComplexSignal(S, 0, COMPLEX_NO);

        /* Configure the dwork 2 (__dtBusInfo) */
        ssSetDWorkDataType(S, 1, SS_INT32);
        ssSetDWorkUsageType(S, 1, SS_DWORK_USED_AS_DWORK);
        ssSetDWorkName(S, 1, "dtBusInfo");
        ssSetDWorkWidth(S, 1, 8);
        ssSetDWorkComplexSignal(S, 1, COMPLEX_NO);
    } /* if */

    /* Set the number of input ports */
    if (!ssSetNumInputPorts(S, 1)) return;

    /* Configure the input port 1 */
    ssSetInputPortDataType(S, 0, SS_DOUBLE);
    {
        int_T u1Width = 1;
        ssSetInputPortWidth(S, 0, u1Width);
    }
    ssSetInputPortComplexSignal(S, 0, COMPLEX_NO);
    ssSetInputPortDirectFeedThrough(S, 0, 1);
    ssSetInputPortAcceptExprInRTW(S, 0, 1);
    ssSetInputPortOverWritable(S, 0, 1);
    ssSetInputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
    ssSetInputPortRequiredContiguous(S, 0, 1);
    ssSetInputPortDimensionsMode(S, 0, FIXED_DIMS_MODE);

    /* Set the number of output ports */
    if (!ssSetNumOutputPorts(S, 1)) return;

    /* Configure the output port 1 */
    #if defined(MATLAB_MEX_FILE) 
    if (ssGetSimMode(S) != SS_SIMMODE_SIZES_CALL_ONLY) {
        DTypeId dataTypeIdReg;

        ssRegisterTypeFromNamedObject(S, "bus_demo_t", &dataTypeIdReg);
        if(dataTypeIdReg == INVALID_DTYPE_ID) return;

        ssSetOutputPortDataType(S, 0, dataTypeIdReg);
    } /* if */
    #endif
    ssSetBusOutputObjectName(S, 0, (void *)"bus_demo_t");
    ssSetBusOutputAsStruct(S, 0, 1);
    {
        int_T y1Width = 1;
        ssSetOutputPortWidth(S, 0, y1Width);
    }
    ssSetOutputPortComplexSignal(S, 0, COMPLEX_NO);
    ssSetOutputPortOptimOpts(S, 0, SS_REUSABLE_AND_LOCAL);
    ssSetOutputPortOutputExprInRTW(S, 0, 0);
    ssSetOutputPortDimensionsMode(S, 0, FIXED_DIMS_MODE);

    /* Register reserved identifiers to avoid name conflict */
    if (ssRTWGenIsCodeGen(S) || ssGetSimMode(S)==SS_SIMMODE_EXTERNAL) {

        /* Register reserved identifier for  */
        ssRegMdlInfo(S, "busDemo_Impl", MDL_INFO_ID_RESERVED, 0, 0, ssGetPath(S));

        /* Register reserved identifier for wrappers */
        if (isSimulationTarget) {

            /* Register reserved identifier for  */
            ssRegMdlInfo(S, "busDemo_Impl_wrapper_Output", MDL_INFO_ID_RESERVED, 0, 0, ssGetPath(S));

            /* Register reserved identifier for allocating PWork for SimulationTarget */
            ssRegMdlInfo(S, "mex_busDemo_Impl_wrapper_allocmem", MDL_INFO_ID_RESERVED, 0, 0, ssGetPath(S));

            /* Register reserved identifier for freeing PWork for SimulationTarget */
            ssRegMdlInfo(S, "mex_busDemo_Impl_wrapper_freemem", MDL_INFO_ID_RESERVED, 0, 0, ssGetPath(S));
        } /* if */
    } /* if */

    /* This S-function can be used in referenced model simulating in normal mode */
    ssSetModelReferenceNormalModeSupport(S, MDL_START_AND_MDL_PROCESS_PARAMS_OK);

    /* Set the number of sample time */
    ssSetNumSampleTimes(S, 1);

    /* Set the compliance for the operating point save/restore. */
    ssSetOperatingPointCompliance(S, USE_DEFAULT_OPERATING_POINT);

    ssSetArrayLayoutForCodeGen(S, SS_ALL);

    /* Set the Simulink version this S-Function has been generated in */
    ssSetSimulinkVersionGeneratedIn(S, "10.6");

    /**
     * All options have the form SS_OPTION_<name> and are documented in
     * matlabroot/simulink/include/simstruc.h. The options should be
     * bitwise or'd together as in
     *    ssSetOptions(S, (SS_OPTION_name1 | SS_OPTION_name2))
     */
    ssSetOptions(S,
//         SS_OPTION_USE_TLC_WITH_ACCELERATOR |
        SS_OPTION_CAN_BE_CALLED_CONDITIONALLY |
        SS_OPTION_EXCEPTION_FREE_CODE |
//         SS_OPTION_WORKS_WITH_CODE_REUSE |
//         SS_OPTION_SFUNCTION_INLINED_FOR_RTW |
        SS_OPTION_DISALLOW_CONSTANT_SAMPLE_TIME
    );
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static void mdlInitializeSampleTimes(SimStruct *S)
{
    ssSetSampleTime(S, 0, INHERITED_SAMPLE_TIME);
    ssSetOffsetTime(S, 0, FIXED_IN_MINOR_STEP_OFFSET);

    #if defined(ssSetModelReferenceSampleTimeDefaultInheritance)
    ssSetModelReferenceSampleTimeDefaultInheritance(S);
    #endif
}

#define MDL_SET_WORK_WIDTHS
#if defined(MDL_SET_WORK_WIDTHS) && defined(MATLAB_MEX_FILE)
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static void mdlSetWorkWidths(SimStruct *S)
{
}
#endif

#define MDL_START
#if defined(MDL_START)
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static void mdlStart(SimStruct *S)
{
    if (IS_SIMULATION_TARGET(S)) {

        /* Access bus/struct information */
        int32_T* __dtSizeInfo = (int32_T*) ssGetDWork(S, 0);
        int32_T* __dtBusInfo = (int32_T*) ssGetDWork(S, 1);


        /* Get common data type Id */
        DTypeId __bus_demo_tId = ssGetDataTypeId(S, "bus_demo_t");
        DTypeId __doubleId = ssGetDataTypeId(S, "double");

        /* Get common data type size */
        __dtSizeInfo[0] = ssGetDataTypeSize(S, __bus_demo_tId);
        __dtSizeInfo[1] = ssGetDataTypeSize(S, __doubleId);

        /* Get information for accessing bus_demo_t.E1 */
        __dtBusInfo[0] = ssGetBusElementOffset(S, __bus_demo_tId, 0);
        __dtBusInfo[1] = __dtSizeInfo[1];

        /* Get information for accessing bus_demo_t.E2 */
        __dtBusInfo[2] = ssGetBusElementOffset(S, __bus_demo_tId, 1);
        __dtBusInfo[3] = __dtSizeInfo[1];

        /* Get information for accessing bus_demo_t.E3 */
        __dtBusInfo[4] = ssGetBusElementOffset(S, __bus_demo_tId, 2);
        __dtBusInfo[5] = __dtSizeInfo[1];

        /* Get information for accessing bus_demo_t.E4 */
        __dtBusInfo[6] = ssGetBusElementOffset(S, __bus_demo_tId, 3);
        __dtBusInfo[7] = __dtSizeInfo[1];


        /* Alloc memory for the pwork 1 (__y1BUS) */
        {
            bus_demo_t* __y1BUS = (bus_demo_t*)calloc(sizeof(bus_demo_t), ssGetOutputPortWidth(S, 0));
            if (__y1BUS==NULL) {
                ssSetErrorStatus(S, "Unexpected error during the memory allocation for __y1BUS");
                return;
            } /* if */
            ssSetPWorkValue(S, 0, __y1BUS);
        }

    } /* if */
}
#endif

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static void mdlOutputs(SimStruct *S, int_T tid)
{
    if (IS_SIMULATION_TARGET(S)) {

        /* Access bus/struct information */
        int32_T* __dtSizeInfo = (int32_T*) ssGetDWork(S, 0);
        int32_T* __dtBusInfo = (int32_T*) ssGetDWork(S, 1);


        /* Get access to Parameter/Input/Output/DWork data */
        real_T* u1 = (real_T*) ssGetInputPortSignal(S, 0);
        char* y1 = (char*) ssGetOutputPortSignal(S, 0);

        bus_demo_t* __y1BUS = (bus_demo_t*) ssGetPWorkValue(S, 0);

        /**
         *  +-------------------------------+
         *  | Call the legacy code function |
         *  +-------------------------------+
         */
        busDemo_Impl( u1, __y1BUS );

        /* Assign the user structure __y1BUS to the Simulink structure y1 */
        (void) memcpy(y1 +  __dtBusInfo[0], &__y1BUS[0].E1,  __dtBusInfo[1]);
        (void) memcpy(y1 +  __dtBusInfo[2], &__y1BUS[0].E2,  __dtBusInfo[3]);
        (void) memcpy(y1 +  __dtBusInfo[4], &__y1BUS[0].E3,  __dtBusInfo[5]);
        (void) memcpy(y1 +  __dtBusInfo[6], &__y1BUS[0].E4,  __dtBusInfo[7]);
    } /* if */
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static void mdlTerminate(SimStruct *S)
{
    if (IS_SIMULATION_TARGET(S)) {

        /* Access bus/struct information */
        int32_T* __dtSizeInfo = (int32_T*) ssGetDWork(S, 0);
        int32_T* __dtBusInfo = (int32_T*) ssGetDWork(S, 1);


        /* Free memory for the pwork 1 (__y1BUS) */
        {
            bus_demo_t* __y1BUS = (bus_demo_t*)ssGetPWorkValue(S, 0);
            if (__y1BUS!=NULL) {
                free(__y1BUS);
                ssSetPWorkValue(S, 0, NULL);
            } /* if */
        }

    } /* if */
}


////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
static int_T GetRTWEnvironmentMode(SimStruct *S)
{
    int_T status;
    mxArray * err;
    mxArray *plhs[1];
    mxArray *prhs[1];

    /* Get the name of the Simulink block diagram */
    prhs[0] = mxCreateString(ssGetBlockDiagramName(S));
    plhs[0] = NULL;

    /* Call "isSimulationTarget = rtwenvironmentmode(modelName)" in MATLAB */
    err = mexCallMATLABWithTrap(1, plhs, 1, prhs, "rtwenvironmentmode");

    mxDestroyArray(prhs[0]);

    /* Set the error status if an error occurred */
    if (err) {
        if (plhs[0]) {
            mxDestroyArray(plhs[0]);
            plhs[0] = NULL;
        } /* if: } */
        ssSetErrorStatus(S, "Unknown error during call to 'rtwenvironmentmode'.");
        return -1;
    } /* if */

    /* Get the value returned by rtwenvironmentmode(modelName) */
    if (plhs[0]) {
        status = (int_T) (mxGetScalar(plhs[0]) != 0);
        mxDestroyArray(plhs[0]);
        plhs[0] = NULL;
    } /* if */

    return status;
}

/* Required S-function trailer */
#ifdef    MATLAB_MEX_FILE
# include "simulink.c"
#else
# include "cg_sfun.h"
#endif

