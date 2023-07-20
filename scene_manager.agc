// File: scene_manager.agc
// Created: 23-07-20

// Global Definitions
global DVM_SceneManager_SceneStack as integer[]

//Function Definitions
function DVM_SceneManager_SyncScene()
	if DVM_SceneManager_SceneStack.length = 0 then exitfunction
	
	scene as integer
	scene = DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length - 1]
	
	select scene
		case DVM_CONST_TEST_SCENE
			test_scene_sync()
		endcase
	endselect
	
endfunction

function DVM_SceneManager_PushScene(scene as integer)
	//Maybe hide previous scene?
	
	DVM_SceneManager_SceneStack.insert(scene)
	
	select scene
		case DVM_CONST_TEST_SCENE
			test_scene_setup()
		endcase
	endselect
endfunction

function DVM_SceneManager_PopScene()
	if DVM_SceneManager_SceneStack.length = 0 then exitfunction
	
	scene as integer
	scene = DVM_SceneManager_SceneStack[DVM_SceneManager_SceneStack.length - 1]
	DVM_SceneManager_SceneStack.remove()
	
	select scene
		case DVM_CONST_TEST_SCENE
			test_scene_cleanup()
		endcase
	endselect
	
endfunction