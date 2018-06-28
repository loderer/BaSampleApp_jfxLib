classdef Application < handle
    %APPLICATION Runs the sample application.
        
    methods        
        function start(~)   
            % Create javaFX-application.
            jfxApplication = javaObject('jfx_4_matlab.JFXApplication');
            % Show sample scene.
            SampleController(jfxApplication); 
        end
    end
end

