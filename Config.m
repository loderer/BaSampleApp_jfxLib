classdef Config    
    methods(Static) 
        function ret = jfxrtPath
            ret = 'C:\Program Files\MATLAB\R2015b\sys\java\jre\win64\jre\lib\jfxrt.jar';
        end
        
        function ret = jfx4matlabPath
            ret = 'C:\Users\rudi\Documents\GitHub\BaJavaFx\out\artifacts\jfx4matlab_jar\jfx4matlab.jar';
        end
        
        function ret = pathToSampleFxml
            ret = 'C:\Users\rudi\Documents\GitHub\BaSampleApp_jfxLib\sample_app\sample.fxml'; 
        end
    end
end

