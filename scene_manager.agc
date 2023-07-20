// File: scene_manager.agc
// Created: 23-07-20

// Global Definitions
global DVM_SceneManager_SceneStack as Scene[]

//Function Definitions
function DVM_SceneManager_SyncScene()
	if DVM_SceneManager_SceneStack.length = -1 then exitfunction
	
	scene as Scene
	scene = DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length]
	
	select scene.id
		case DVM_CONST_TEST_SCENE
			test_scene_sync()
		endcase
		case DVM_CONST_TEST_SCENE_2
			test_scene_2_sync()
		endcase
	endselect
	
endfunction

function DVM_SceneManager_PushScene(scene as Scene)
	
	if(DVM_SceneManager_SceneStack.find(scene.id) <> -1) then exitfunction
	
	if DVM_SceneManager_SceneStack.length > -1 
		current_scene as Scene
		current_scene = DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length]
		DVM_Scene_HideScene(current_scene)
		DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length] = current_scene
	endif
		
	DVM_SceneManager_SceneStack.insert(scene)
	
endfunction

function DVM_SceneManager_PopScene()
	
	if DVM_SceneManager_SceneStack.length = 0 then exitfunction
	
	scene as Scene
	scene = DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length]
	DVM_SceneManager_SceneStack.remove()
	DVM_Scene_DestroyScene(scene)
	
	select scene.id
		case DVM_CONST_TEST_SCENE
			test_scene_cleanup()
		endcase
		case DVM_CONST_TEST_SCENE_2
			test_scene_2_cleanup()
		endcase
	endselect
	
	scene = DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length]
	DVM_Scene_RestoreScene(scene)
	DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length] = scene
endfunction