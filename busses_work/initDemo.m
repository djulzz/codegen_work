clear all;
close all;
clc;

addpath( 'mex_functions' );

doConversionTo2019b = false;
doCompiltion        = false;
doBuildMexFunctions = true;

% demoConfig          = create_demoConfig(  );
bus_demo_t          = create_bus_demo_t(  );
target_system       = 'busDemo';

load_system( target_system );
open_system( target_system );

if true == doBuildMexFunctions
    build_mex_busDemo_Impl;
end
if true == doCompiltion
    fprintf( 'Running codegen-build...\n' );
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

% mex_busDemo_Impl
% def = legacy_code('initialize');
% def.SFunctionName = 'mex_busDemo_Impl_RT';
% def.OutputFcnSpec = 'void busDemo_Impl( double u1, bus_demo_t y1[1] )';
% def.HeaderFiles   = { 'bus_definition.h', 'busDemo_Impl_Private.h' };
% def.SourceFiles   = { 'busDemo_Impl_Private.cpp' };
% def.IncPaths      = { 'sldemo_lct_src' };
% def.SrcPaths      = { 'sldemo_lct_src' };
% legacy_code( 'rtwmakecfg_generate', def );

makeInfo = rtwmakecfg(  );