clear all;
close all;
clc;

doConversionTo2019b = true;
doCompiltion = true;


demoConfig      = create_demoConfig(  );
bus_demo_t      = create_bus_demo_t(  );
target_system   = 'busDemo';

load_system( target_system );
% open_system( target_system );

if true == doCompiltion
    t_start = tic;
    rtwbuild( target_system );
    t_stop = int32( floor( toc( t_start ) ) );
    fprintf( 'Target [%s] build time = %i seconds\n',...
        target_system, t_stop );
end

if true == doConversionTo2019b
    target_2029B = 'busDemo_2019b';
    exportedFile = Simulink.exportToVersion( target_system,...
        target_2029B, 'R2019b' );
end
