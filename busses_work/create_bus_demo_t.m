function bus_demo_t = create_bus_demo_t(  )
    bus_demo_t = Simulink.Bus;
    names = { 'E1', 'E2', 'E3', 'E4' };
    for ii = numel( names ) : -1 : 1
        e( ii ) = Simulink.BusElement;
        e( ii ).Name = names{ ii };
        e( ii ).DataType = 'double';
        e( ii ).Dimensions = 1;
        e( ii ).Complexity = 'real';
    end
    bus_demo_t.DataScope = 'Imported';
    bus_demo_t.HeaderFile = 'bus_definition.h';
    bus_demo_t.Elements = e;
    return;
end
