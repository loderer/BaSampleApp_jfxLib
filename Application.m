classdef Application < handle
    %STARTUP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        stage; 
        stageObservable_h;
        jfxThread; 
        sceneObservable_h;
    end
    
    methods        
        function startup(obj)   
            % Create javaFX-application.
            jfxApplication = javaObject('jfx_4_matlab.JFXApplication');

            % Create stage.
            stageHandle = jfxApplication.createStage('Hello World', javafx.stage.Modality.NONE, []);
            obj.stage = stageHandle.getStage(); 
            % Register event-listener on stage. 
            obj.stageObservable_h = handle(...
                stageHandle.getObservable(),'CallbackProperties');
            set(obj.stageObservable_h, 'EventCallback',...
                @(h,e)obj.handleStageEvent(e));

            % Create scene. 
            sceneHandle = jfxApplication.showScene(stageHandle.getStage(),...
                        'C:\Users\rudi\Documents\GitHub\BaSampleApp_jfxLib\sample.fxml'); 
            obj.jfxThread = sceneHandle.getJfxThread();
            % Register event-listener on scene.
            obj.sceneObservable_h = handle(...
                sceneHandle.getObservable(),'CallbackProperties');
            set(obj.sceneObservable_h, 'EventCallback',...
                @(h,e)obj.handleSceneEvent(e));
        end
        
        function handleStageEvent(obj, e) 
             if(strcmp(e.fxId, 'root')...
                    && strcmp(e.action, 'CLOSE'))
                % Unregister the scene callbacks. 
                set(obj.sceneObservable_h, 'EventCallback', ''); 
                % Unregister all callbacks from the stage.
                set(obj.stageObservable_h, 'EventCallback', '');
                % Close stage. 
                obj.jfxThread.applyTask(obj.stage, 'close');
             end
        end
        
        function handleSceneEvent(obj, e) 
            if(strcmp(e.fxId, 'btn')...
                    && strcmp(e.action, 'ACTION'))
                 lbl = obj.jfxThread.getUiElement('lbl');
                 obj.jfxThread.applyTask(lbl, 'setText', 'heureka');
            end
        end
    end
    
end

