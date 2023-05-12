function cs = create_demoConfig()

cs = Simulink.ConfigSet;


cs.set_param('Name', 'demoConfig'); % Name
cs.set_param('Description', ''); % Description
cs.switchTarget('grt.tlc','');
cs.set_param('HardwareBoard', 'None');   % Hardware board
cs.set_param('TargetLang', 'C');   % Language
cs.set_param('CodeInterfacePackaging', 'Nonreusable function');   % Code interface packaging
cs.set_param('GenerateAllocFcn', 'off');   % Use dynamic memory allocation for model initialization
cs.set_param('Solver', 'ode4');   % Solver

% Solver
cs.set_param('StartTime', '0.0');   % Start time
cs.set_param('StopTime', '20.0');   % Stop time
cs.set_param('SolverName', 'ode4');   % Solver
cs.set_param('SolverType', 'Fixed-step');   % Type
cs.set_param('SampleTimeConstraint', 'Unconstrained');   % Periodic sample time constraint
cs.set_param('FixedStep', '0.01');   % Fixed-step size (fundamental sample time)
cs.set_param('EnableFixedStepZeroCrossing', 'off');   % Enable zero-crossing detection for fixed-step simulation
cs.set_param('ConcurrentTasks', 'off');   % Allow tasks to execute concurrently on target
cs.set_param('EnableMultiTasking', 'off');   % Treat each discrete rate as a separate task
cs.set_param('AllowMultiTaskInputOutput', 'off');   % Allow multiple tasks to access inputs and outputs
cs.set_param('PositivePriorityOrder', 'off');   % Higher priority value indicates higher task priority
cs.set_param('AutoInsertRateTranBlk', 'off');   % Automatically handle rate transition for data transfer

% Data Import/Export
cs.set_param('Decimation', '1');   % Decimation
cs.set_param('LoadExternalInput', 'off');   % Load external input
cs.set_param('SaveFinalState', 'off');   % Save final state
cs.set_param('LoadInitialState', 'off');   % Load initial state
cs.set_param('LimitDataPoints', 'off');   % Limit data points
cs.set_param('SaveFormat', 'DataSet');   % Format
cs.set_param('SaveOutput', 'on');   % Save output
cs.set_param('SaveState', 'off');   % Save states
cs.set_param('SignalLogging', 'on');   % Signal logging
cs.set_param('DSMLogging', 'on');   % Data stores
cs.set_param('StreamToWks', 'on');   % Stream To Workspace blocks
cs.set_param('InspectSignalLogs', 'off');   % Record logged workspace data in Simulation Data Inspector
cs.set_param('SaveTime', 'on');   % Save time
cs.set_param('ReturnWorkspaceOutputs', 'on');   % Single simulation output
cs.set_param('TimeSaveName', 'tout');   % Time variable
cs.set_param('OutputSaveName', 'yout');   % Output variable
cs.set_param('SignalLoggingName', 'logsout');   % Signal logging name
cs.set_param('DSMLoggingName', 'dsmout');   % Data stores logging name
cs.set_param('ReturnWorkspaceOutputsName', 'out');   % Simulation output variable
cs.set_param('LoggingToFile', 'off');   % Log Dataset data to file
cs.set_param('DatasetSignalFormat', 'timeseries');   % Dataset signal format
cs.set_param('LoggingIntervals', '[-inf, inf]');   % Logging intervals

% Optimization
cs.set_param('BlockReduction', 'on');   % Block reduction
cs.set_param('BooleanDataType', 'on');   % Implement logic signals as Boolean data (vs. double)
cs.set_param('ConditionallyExecuteInputs', 'on');   % Conditional input branch execution
cs.set_param('DefaultParameterBehavior', 'Tunable');   % Default parameter behavior
cs.set_param('UseDivisionForNetSlopeComputation', 'off');   % Use division for fixed-point net slope computation
cs.set_param('GainParamInheritBuiltInType', 'off');   % Gain parameters inherit a built-in integer type that is lossless
cs.set_param('UseFloatMulNetSlope', 'off');   % Use floating-point multiplication to handle net slope corrections
cs.set_param('InheritOutputTypeSmallerThanSingle', 'off');   % Inherit floating-point output type smaller than single precision
cs.set_param('DefaultUnderspecifiedDataType', 'double');   % Default for underspecified data type
cs.set_param('DataBitsets', 'off');   % Use bitsets for storing Boolean data
cs.set_param('StateBitsets', 'off');   % Use bitsets for storing state configuration
cs.set_param('LocalBlockOutputs', 'on');   % Enable local block outputs
cs.set_param('EnableMemcpy', 'on');   % Use memcpy for vector assignment
cs.set_param('ExpressionFolding', 'on');   % Eliminate superfluous local variables (expression folding)
cs.set_param('ReuseModelBlockBuffer', 'off');   % Reuse output buffers of Model blocks
cs.set_param('OptimizeBlockIOStorage', 'on');   % Signal storage reuse
cs.set_param('BufferReuse', 'on');   % Reuse local block outputs
cs.set_param('MemcpyThreshold', 64);   % Memcpy threshold (bytes)
cs.set_param('RollThreshold', 5);   % Loop unrolling threshold
cs.set_param('ActiveStateOutputEnumStorageType', 'Native Integer');   % Base storage type for automatically created enumerations
cs.set_param('InitFltsAndDblsToZero', 'off');   % Use memset to initialize floats and doubles to 0.0
cs.set_param('EfficientFloat2IntCast', 'off');   % Remove code from floating-point to integer conversions that wraps out-of-range values
cs.set_param('EfficientMapNaN2IntZero', 'on');   % Remove code from floating-point to integer conversions with saturation that maps NaN to zero
cs.set_param('LifeSpan', 'auto');   % Application lifespan (days)
cs.set_param('MaxStackSize', 'Inherit from target');   % Maximum stack size (bytes)
cs.set_param('BufferReusableBoundary', 'on');   % Buffer for reusable subsystems
cs.set_param('SimCompilerOptimization', 'off');   % Compiler optimization level
cs.set_param('AccelVerboseBuild', 'off');   % Verbose accelerator builds
cs.set_param('UseRowMajorAlgorithm', 'off');   % Use algorithms optimized for row-major array layout
cs.set_param('DenormalBehavior', 'GradualUnderflow');   % In accelerated simulation modes, denormal numbers can be flushed to zero using 'flush-to-zero' option.

% Diagnostics
cs.set_param('RTPrefix', 'error');   % "rt" prefix for identifiers
cs.set_param('ConsistencyChecking', 'none');   % Solver data inconsistency
cs.set_param('ArrayBoundsChecking', 'none');   % Array bounds exceeded
cs.set_param('SignalInfNanChecking', 'none');   % Inf or NaN block output
cs.set_param('StringTruncationChecking', 'error');   % String truncation checking
cs.set_param('SignalRangeChecking', 'none');   % Simulation range checking
cs.set_param('ReadBeforeWriteMsg', 'UseLocalSettings');   % Detect read before write
cs.set_param('WriteAfterWriteMsg', 'UseLocalSettings');   % Detect write after write
cs.set_param('WriteAfterReadMsg', 'UseLocalSettings');   % Detect write after read
cs.set_param('AlgebraicLoopMsg', 'warning');   % Algebraic loop
cs.set_param('ArtificialAlgebraicLoopMsg', 'warning');   % Minimize algebraic loop
cs.set_param('SaveWithDisabledLinksMsg', 'warning');   % Block diagram contains disabled library links
cs.set_param('SaveWithParameterizedLinksMsg', 'warning');   % Block diagram contains parameterized library links
cs.set_param('UnderspecifiedInitializationDetection', 'Simplified');   % Underspecified initialization detection
cs.set_param('MergeDetectMultiDrivingBlocksExec', 'error');   % Detect multiple driving blocks executing at the same time step
cs.set_param('SignalResolutionControl', 'UseLocalSettings');   % Signal resolution
cs.set_param('BlockPriorityViolationMsg', 'warning');   % Block priority violation
cs.set_param('MinStepSizeMsg', 'warning');   % Min step size violation
cs.set_param('TimeAdjustmentMsg', 'none');   % Sample hit time adjusting
cs.set_param('MaxConsecutiveZCsMsg', 'error');   % Consecutive zero crossings violation
cs.set_param('MaskedZcDiagnostic', 'warning');   % Masked zero crossings
cs.set_param('IgnoredZcDiagnostic', 'warning');   % Ignored zero crossings
cs.set_param('SolverPrmCheckMsg', 'none');   % Automatic solver parameter selection
cs.set_param('InheritedTsInSrcMsg', 'warning');   % Source block specifies -1 sample time
cs.set_param('MultiTaskDSMMsg', 'error');   % Multitask data store
cs.set_param('MultiTaskCondExecSysMsg', 'error');   % Multitask conditionally executed subsystem
cs.set_param('MultiTaskRateTransMsg', 'error');   % Multitask data transfer
cs.set_param('SingleTaskRateTransMsg', 'none');   % Single task data transfer
cs.set_param('TasksWithSamePriorityMsg', 'warning');   % Tasks with equal priority
cs.set_param('SigSpecEnsureSampleTimeMsg', 'warning');   % Enforce sample times specified by Signal Specification blocks
cs.set_param('CheckMatrixSingularityMsg', 'none');   % Division by singular matrix
cs.set_param('IntegerOverflowMsg', 'warning');   % Wrap on overflow
cs.set_param('Int32ToFloatConvMsg', 'warning');   % 32-bit integer to single precision float conversion
cs.set_param('ParameterDowncastMsg', 'error');   % Detect downcast
cs.set_param('ParameterOverflowMsg', 'error');   % Detect overflow
cs.set_param('ParameterUnderflowMsg', 'none');   % Detect underflow
cs.set_param('ParameterPrecisionLossMsg', 'warning');   % Detect precision loss
cs.set_param('ParameterTunabilityLossMsg', 'warning');   % Detect loss of tunability
cs.set_param('FixptConstUnderflowMsg', 'none');   % Detect underflow
cs.set_param('FixptConstOverflowMsg', 'none');   % Detect overflow
cs.set_param('FixptConstPrecisionLossMsg', 'none');   % Detect precision loss
cs.set_param('UnderSpecifiedDataTypeMsg', 'none');   % Underspecified data types
cs.set_param('UnnecessaryDatatypeConvMsg', 'none');   % Unnecessary type conversions
cs.set_param('VectorMatrixConversionMsg', 'none');   % Vector/matrix block input conversion
cs.set_param('FcnCallInpInsideContextMsg', 'error');   % Context-dependent inputs
cs.set_param('SignalLabelMismatchMsg', 'none');   % Signal label mismatch
cs.set_param('UnconnectedInputMsg', 'none');   % Unconnected block input ports
cs.set_param('UnconnectedOutputMsg', 'none');   % Unconnected block output ports
cs.set_param('UnconnectedLineMsg', 'none');   % Unconnected line
cs.set_param('SFcnCompatibilityMsg', 'none');   % S-function upgrades needed
cs.set_param('FrameProcessingCompatibilityMsg', 'error');   % Block behavior depends on frame status of signal
cs.set_param('UniqueDataStoreMsg', 'none');   % Duplicate data store names
cs.set_param('BusObjectLabelMismatch', 'warning');   % Element name mismatch
cs.set_param('RootOutportRequireBusObject', 'warning');   % Unspecified bus object at root Outport block
cs.set_param('AssertControl', 'UseLocalSettings');   % Model Verification block enabling
cs.set_param('AllowSymbolicDim', 'on');   % Allow symbolic dimension specification
cs.set_param('ModelReferenceIOMsg', 'none');   % Invalid root Inport/Outport block connection
cs.set_param('ModelReferenceVersionMismatchMessage', 'none');   % Model block version mismatch
cs.set_param('ModelReferenceIOMismatchMessage', 'none');   % Port and parameter mismatch
cs.set_param('UnknownTsInhSupMsg', 'warning');   % Unspecified inheritability of sample time
cs.set_param('ModelReferenceDataLoggingMessage', 'warning');   % Unsupported data logging
cs.set_param('ModelReferenceNoExplicitFinalValueMsg', 'none');   % No explicit final value for model arguments
cs.set_param('ModelReferenceSymbolNameMessage', 'warning');   % Insufficient maximum identifier length
cs.set_param('ModelReferenceExtraNoncontSigs', 'error');   % Extraneous discrete derivative signals
cs.set_param('StateNameClashWarn', 'none');   % State name clash
cs.set_param('OperatingPointInterfaceChecksumMismatchMsg', 'warning');   % Operating point restore interface checksum mismatch
cs.set_param('NonCurrentReleaseOperatingPointMsg', 'error');   % Operating point object from a different release
cs.set_param('InitInArrayFormatMsg', 'warning');   % Initial state is array
cs.set_param('StrictBusMsg', 'ErrorLevel1');   % Bus signal treated as vector
cs.set_param('BusNameAdapt', 'WarnAndRepair');   % Repair bus selections
cs.set_param('NonBusSignalsTreatedAsBus', 'none');   % Non-bus signals treated as bus signals
cs.set_param('SFUnusedDataAndEventsDiag', 'warning');   % Unused data, events, messages and functions
cs.set_param('SFUnexpectedBacktrackingDiag', 'error');   % Unexpected backtracking
cs.set_param('SFInvalidInputDataAccessInChartInitDiag', 'warning');   % Invalid input data access in chart initialization
cs.set_param('SFNoUnconditionalDefaultTransitionDiag', 'error');   % No unconditional default transitions
cs.set_param('SFTransitionOutsideNaturalParentDiag', 'warning');   % Transition outside natural parent
cs.set_param('SFUnreachableExecutionPathDiag', 'warning');   % Unreachable execution path
cs.set_param('SFUndirectedBroadcastEventsDiag', 'warning');   % Undirected event broadcasts
cs.set_param('SFTransitionActionBeforeConditionDiag', 'warning');   % Transition action specified before condition action
cs.set_param('SFOutputUsedAsStateInMooreChartDiag', 'error');   % Read-before-write to output in Moore chart
cs.set_param('SFTemporalDelaySmallerThanSampleTimeDiag', 'warning');   % Absolute time temporal value shorter than sampling period
cs.set_param('SFSelfTransitionDiag', 'warning');   % Self-transition on leaf state
cs.set_param('SFExecutionAtInitializationDiag', 'warning');   % 'Execute-at-initialization' disabled in presence of input events
cs.set_param('SFMachineParentedDataDiag', 'error');   % Use of machine-parented data instead of Data Store Memory
cs.set_param('IntegerSaturationMsg', 'warning');   % Saturate on overflow
cs.set_param('AllowedUnitSystems', 'all');   % Allowed unit systems
cs.set_param('UnitsInconsistencyMsg', 'warning');   % Units inconsistency messages
cs.set_param('AllowAutomaticUnitConversions', 'on');   % Allow automatic unit conversions
cs.set_param('ForceCombineOutputUpdateInSim', 'off');   % Combine output and update methods for code generation and simulation
cs.set_param('UnderSpecifiedDimensionMsg', 'none');   % Underspecified dimensions
cs.set_param('DebugExecutionForFMUViaOutOfProcess', 'off');   % FMU Import blocks
cs.set_param('ArithmeticOperatorsInVariantConditions', 'error');   % Arithmetic operations in variant conditions
cs.set_param('VariantConditionMismatch', 'none');   % Variant condition mismatch at signal source and destination
cs.set_param('InheritVATfromSVC', 'warning');   % Variant activation time inherited from Simulink.VariantControl
cs.set_param('VariantConfigNotUsedByTopModel', 'warning');   % Variant configuration not used by top model

% Hardware Implementation
cs.set_param('ProdHWDeviceType', 'Intel->x86-64 (Windows64)');   % Production device vendor and type
cs.set_param('ProdLongLongMode', 'off');   % Support long long
cs.set_param('ProdEqTarget', 'on');   % Test hardware is the same as production hardware
cs.set_param('TargetPreprocMaxBitsSint', 32);   % Maximum bits for signed integer in C preprocessor
cs.set_param('TargetPreprocMaxBitsUint', 32);   % Maximum bits for unsigned integer in C preprocessor
cs.set_param('HardwareBoardFeatureSet', 'EmbeddedCoderHSP');   % Feature set for selected hardware board

% Model Referencing
cs.set_param('UpdateModelReferenceTargets', 'IfOutOfDateOrStructuralChange');   % Rebuild
cs.set_param('EnableRefExpFcnMdlSchedulingChecks', 'off');   % Enable strict scheduling checks for referenced models
cs.set_param('EnableParallelModelReferenceBuilds', 'off');   % Enable parallel model reference builds
cs.set_param('ParallelModelReferenceErrorOnInvalidPool', 'on');   % Perform consistency check on parallel pool
cs.set_param('ModelReferenceNumInstancesAllowed', 'Multi');   % Total number of instances allowed per top model
cs.set_param('PropagateVarSize', 'Infer from blocks in model');   % Propagate sizes of variable-size signals
cs.set_param('ModelDependencies', '');   % Model dependencies
cs.set_param('ModelReferencePassRootInputsByReference', 'on');   % Pass fixed-size scalar root inputs by value for code generation
cs.set_param('ModelReferenceMinAlgLoopOccurrences', 'off');   % Minimize algebraic loop occurrences
cs.set_param('PropagateSignalLabelsOutOfModel', 'on');   % Propagate all signal labels out of the model
cs.set_param('SupportModelReferenceSimTargetCustomCode', 'off');   % Include custom code for referenced models
cs.set_param('UseModelRefSolver', 'off');   % Use local solver when referencing model

% Simulation Target
cs.set_param('SimCustomSourceCode', '');   % Additional code
cs.set_param('SimUserSources', '');   % Source files
cs.set_param('SimCustomHeaderCode', '');   % Include headers
cs.set_param('SimCustomInitializer', '');   % Initialize code
cs.set_param('SimCustomTerminator', '');   % Terminate code
cs.set_param('SimReservedNameArray', []);   % Reserved names
cs.set_param('SimUserIncludeDirs', '');   % Include directories
cs.set_param('SimUserLibraries', '');   % Libraries
cs.set_param('SimUserDefines', '');   % Defines
cs.set_param('SimCustomCompilerFlags', '');   % Compiler flags
cs.set_param('SimCustomLinkerFlags', '');   % Linker flags
cs.set_param('SFSimEnableDebug', 'off');   % Allow setting breakpoints during simulation
cs.set_param('SFSimEcho', 'on');   % Echo expressions without semicolons
cs.set_param('SimCtrlC', 'on');   % Break on Ctrl-C
cs.set_param('SimIntegrity', 'on');   % Enable memory integrity checks
cs.set_param('SimParseCustomCode', 'on');   % Import custom code
cs.set_param('SimDebugExecutionForCustomCode', 'off');   % Simulate custom code in a separate process
cs.set_param('SimAnalyzeCustomCode', 'off');   % Enable custom code analysis
cs.set_param('SimGenImportedTypeDefs', 'off');   % Generate typedefs for imported bus and enumeration types
cs.set_param('CompileTimeRecursionLimit', 50);   % Compile-time recursion limit for MATLAB functions
cs.set_param('EnableRuntimeRecursion', 'on');   % Enable run-time recursion for MATLAB functions
cs.set_param('EnableImplicitExpansion', 'on');   % Enable implicit expansion in MATLAB functions
cs.set_param('MATLABDynamicMemAlloc', 'on');   % Dynamic memory allocation in MATLAB functions
cs.set_param('MATLABDynamicMemAllocThreshold', 65536);   % Dynamic memory allocation threshold in MATLAB functions
cs.set_param('LegacyBehaviorForPersistentVarInContinuousTime', 'off');   % Enable continuous-time MATLAB functions to write to initialized persistent variables
cs.set_param('CustomCodeFunctionArrayLayout', []);   % Exception by function...
cs.set_param('DefaultCustomCodeFunctionArrayLayout', 'NotSpecified');   % Default function array layout
cs.set_param('CustomCodeUndefinedFunction', 'FilterOut');   % Undefined function and variable handling
cs.set_param('CustomCodeGlobalsAsFunctionIO', 'off');   % Enable global variables as function interfaces
cs.set_param('DefaultCustomCodeDeterministicFunctions', 'None');   % Deterministic functions
cs.set_param('SimHardwareAcceleration', 'generic');   % Hardware acceleration
cs.set_param('GPUAcceleration', 'off');   % GPU acceleration
cs.set_param('SimTargetLang', 'C');   % Language

% Code Generation
cs.set_param('TLCOptions', '');   % TLC command line options
cs.set_param('GenCodeOnly', 'off');   % Generate code only
cs.set_param('PackageGeneratedCodeAndArtifacts', 'off');   % Package code and artifacts
cs.set_param('PostCodeGenCommand', '');   % Post code generation command
cs.set_param('GenerateReport', 'off');   % Create code generation report
cs.set_param('RTWVerbose', 'on');   % Verbose build
cs.set_param('RetainRTWFile', 'off');   % Retain .rtw file
cs.set_param('ProfileTLC', 'off');   % Profile TLC
cs.set_param('TLCDebug', 'off');   % Start TLC debugger when generating code
cs.set_param('TLCCoverage', 'off');   % Start TLC coverage when generating code
cs.set_param('TLCAssert', 'off');   % Enable TLC assertion
cs.set_param('RTWUseSimCustomCode', 'off');   % Use the same custom code settings as Simulation Target
cs.set_param('CustomSourceCode', '');   % Additional code
cs.set_param('CustomHeaderCode', '');   % Include headers
cs.set_param('CustomInclude', '');   % Include directories
cs.set_param('CustomSource', '');   % Source files
cs.set_param('CustomLibrary', '');   % Libraries
cs.set_param('CustomDefine', '');   % Defines
cs.set_param('CustomBLASCallback', '');   % Custom BLAS library callback
cs.set_param('CustomLAPACKCallback', '');   % Custom LAPACK library callback
cs.set_param('CustomFFTCallback', '');   % Custom FFT library callback
cs.set_param('CustomInitializer', '');   % Initialize code
cs.set_param('CustomTerminator', '');   % Terminate code
cs.set_param('Toolchain', 'Automatically locate an installed toolchain');   % Toolchain
cs.set_param('BuildConfiguration', 'Faster Builds');   % Build configuration
cs.set_param('CodeExecutionProfiling', 'off');   % Measure task execution time
cs.set_param('TargetLangStandard', 'C99 (ISO)');   % Language standard
cs.set_param('ObjectivePriorities', []);   % Prioritized objectives
cs.set_param('CheckMdlBeforeBuild', 'Off');   % Check model before generating code
cs.set_param('GenerateComments', 'on');   % Include comments
cs.set_param('ForceParamTrailComments', 'off');   % Verbose comments for 'Model default' storage class
cs.set_param('MaxIdLength', 31);   % Maximum identifier length
cs.set_param('ShowEliminatedStatement', 'off');   % Show eliminated blocks
cs.set_param('SimulinkBlockComments', 'on');   % Simulink block comments
cs.set_param('StateflowObjectComments', 'off');   % Stateflow object comments
cs.set_param('MATLABSourceComments', 'off');   % MATLAB source code as comments
cs.set_param('UseSimReservedNames', 'off');   % Use the same reserved names as Simulation Target
cs.set_param('ReservedNameArray', []);   % Reserved names
cs.set_param('EnumMemberNameClash', 'error');   % Duplicate enumeration member names
cs.set_param('TargetLibSuffix', '');   % Suffix applied to target library name
cs.set_param('TargetPreCompLibLocation', '');   % Precompiled library location
cs.set_param('CodeReplacementLibrary', 'None');   % Code replacement library
cs.set_param('UtilityFuncGeneration', 'Auto');   % Shared code placement
cs.set_param('MultiwordLength', 2048);   % Maximum word length
cs.set_param('DynamicStringBufferSize', 256);   % Buffer size of dynamically-sized string (bytes)
cs.set_param('GenerateFullHeader', 'on');   % Generate full file banner
cs.set_param('InferredTypesCompatibility', 'off');   % Create preprocessor directive in rtwtypes.h
cs.set_param('GRTInterface', 'off');   % Classic call interface
cs.set_param('CombineOutputUpdateFcns', 'on');   % Single output/update function
cs.set_param('MatFileLogging', 'on');   % MAT-file logging
cs.set_param('LogVarNameModifier', 'rt_');   % MAT-file variable name modifier
cs.set_param('SupportNonFinite', 'on');   % Support non-finite numbers
cs.set_param('ArrayLayout', 'Column-major');   % Array layout
cs.set_param('LUTObjectStructOrderExplicitValues', 'Size,Breakpoints,Table');   % LUT object struct order for explicit value specification
cs.set_param('LUTObjectStructOrderEvenSpacing', 'Size,Breakpoints,Table');   % LUT object struct order for even spacing specification
cs.set_param('InstructionSetExtensions', {'SSE2'});   % Leverage target hardware instruction set extensions
cs.set_param('OptimizeReductions', 'off');   % Optimize reductions
cs.set_param('ExtMode', 'off');   % External mode
cs.set_param('ExtModeTransport', 0);   % Transport layer
cs.set_param('ExtModeMexFile', 'ext_comm');   % MEX-file name
cs.set_param('ExtModeStaticAlloc', 'off');   % Static memory allocation
cs.set_param('ExtModeTesting', 'off');   % External mode testing
cs.set_param('ExtModeMexArgs', '');   % MEX-file arguments
cs.set_param('ExtModeIntrfLevel', 'Level1');   % External mode interface level
cs.set_param('RTWCAPISignals', 'off');   % Generate C API for signals
cs.set_param('RTWCAPIParams', 'off');   % Generate C API for parameters
cs.set_param('RTWCAPIStates', 'off');   % Generate C API for states
cs.set_param('RTWCAPIRootIO', 'off');   % Generate C API for root-level I/O

% Simulink Coverage
cs.set_param('CovEnable', 'off');   % Enable coverage analysis
cs.set_param('RecordCoverage', 'off');   % Record coverage for this model
cs.set_param('CovModelRefEnable', 'off');   % Record coverage for referenced models

% HDL Coder
try 
	cs_componentCC = hdlcoderui.hdlcc;
	cs_componentCC.createCLI();
	cs.attachComponent(cs_componentCC);
catch ME
	warning('Simulink:ConfigSet:AttachComponentError', '%s', ME.message);
end

cs.set_param( 'SaveFormat', 'Array' );