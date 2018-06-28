classdef SampleController < handle
    %SAMPLECONTROLLER Controller for the sample scene.
    
    properties(Access=private)
        % Properties concerning the stage. 
        stage; 
        stageObservable; 
        stageObservable_h; 
        % Properties concerning the scene.
        jfxThread;
        sceneObservable; 
        sceneObservable_h;
        lbl;
    end
    
    methods
        function obj = SampleController(jfxApplication) 
            % Create stage.
            stageHandle = jfxApplication.createStage(...
                'Hello World', javafx.stage.Modality.NONE, []);
            obj.stage = stageHandle.getStage(); 
            obj.stageObservable = stageHandle.getObservable();
            % Init stage.
            obj.registerStage(); 
            
            % Create scene.
            sceneHandle = jfxApplication.showScene(stageHandle.getStage(),...
                        Config.pathToSampleFxml); 
            obj.jfxThread = sceneHandle.getJfxThread();
            obj.sceneObservable = sceneHandle.getObservable();
            % Init scene
            obj.registerScene();
            obj.lbl = obj.jfxThread.getUiElement('lbl');
        end
        
        
        % Functions concerning the stage.----------------------------------
        function handleStageEvent(obj, e)
            % Handle each event on stage-level.
             if(strcmp(e.fxId, 'root')...
                    && strcmp(e.action, 'CLOSE'))
                obj.unregisterStage(); 
                obj.unregisterScene();
                % Close stage. 
                obj.jfxThread.applyTask(obj.stage, 'close');
             end
        end
        
        function registerStage(obj)
            % Register event-listener on stage. 
            obj.stageObservable_h = handle(...
                obj.stageObservable,'CallbackProperties');
            set(obj.stageObservable_h, 'EventCallback',...
                @(h,e)obj.handleStageEvent(e));
        end
        
        function unregisterStage(obj) 
            % Unregister event-listener on stage. 
            set(obj.stageObservable_h, 'EventCallback', '');
        end
        
        % Functions concerning the scene.----------------------------------
        function handleSceneEvent(obj, e) 
            % Handle each event on scene-level.
            if(strcmp(e.fxId, 'btn')...
                    && strcmp(e.action, 'ACTION'))
                % Handle click on btn. 
                obj.jfxThread.applyTask(obj.lbl, 'setText', 'heureka');
            end
        end
        
        function registerScene(obj) 
            % Register event-listener on scene.
            obj.sceneObservable_h = handle(...
                obj.sceneObservable,'CallbackProperties');
            set(obj.sceneObservable_h, 'EventCallback',...
                @(h,e)obj.handleSceneEvent(e));
        end
        
        function unregisterScene(obj)
            % Unregister the event-listener on scene. 
            set(obj.sceneObservable_h, 'EventCallback', ''); 
        end
    end
end

