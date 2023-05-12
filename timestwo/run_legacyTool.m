SFB_LIMITBUS = Simulink.Bus;
SFB_LIMITBUS.HeaderFile = 'sfbuilder_bus_bus.h';
e( 1 ) = Simulink.BusElement;
e( 1 ).Name = 'upper_saturation_limit';
e( 1 ).DataType = 'int32';
e( 1 ).Dimensions = 1;
e( 1 ).Complexity = 'real';

e( 2 ) = Simulink.BusElement;
e( 2 ).Name = 'lower_saturation_limit';
e( 2 ).DataType = 'int32';
e( 2 ).Dimensions = 1;
e( 2 ).Complexity = 'real';

SFB_LIMITBUS.Elements = e;

clear e;

SFB_SIGNALBUS = Simulink.Bus;
SFB_SIGNALBUS.HeaderFile = 'sfbuilder_bus_bus.h';
e( 1 ) = Simulink.BusElement;
e( 1 ).Name = 'input';
e( 1 ).DataType = 'int32';
e( 1 ).Dimensions = 1;
e( 1 ).Complexity = 'real';
SFB_SIGNALBUS.Elements = e;

clear e;

SFB_COUNTERBUS = Simulink.Bus;
SFB_COUNTERBUS.HeaderFile = 'sfbuilder_bus_bus.h';
e( 1 ) = Simulink.BusElement;
e( 1 ).Name = 'inputsignal';
e( 1 ).DataType = 'Bus: SFB_SIGNALBUS';

e( 2 ) = Simulink.BusElement;
e( 2 ).Name = 'limits';
e( 2 ).DataType = 'Bus: SFB_LIMITBUS';

SFB_COUNTERBUS.Elements = e;

clear e;