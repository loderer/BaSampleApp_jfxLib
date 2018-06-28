% Add required directories to classpath.-----------------------------------

% Add all MATLAB-sources to the class path. 
addpath(genpath(...
    'C:\Users\rudi\Documents\GitHub\BaSampleApp_jfxLib'))    
% Add the javaFX-runtime to the static class path. 
javaaddpathstatic(Config.jfxrtPath);    
% Add the javaFX-application to the static class path. 
javaaddpathstatic(Config.jfx4matlabPath); 
%--------------------------------------------------------------------------

app = Application; 
app.start(); 