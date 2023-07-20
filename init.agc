// File: init.agc
// Created: 23-07-20

function DVM_EngineSetup()
	// show all errors
	
	SetErrorMode(DVM_CONST_ERROR_MODE)
	
	// set window properties
	SetWindowTitle( DVM_CONST_GAME_TITLE )
	SetWindowSize( DVM_CONST_WINDOW_WIDTH, DVM_CONST_WINDOW_HEIGHT, 0 )
	SetWindowAllowResize( DVM_CONST_RESIZE_ALLOWED ) // allow the user to resize the window
	
	// set display properties
	SetVirtualResolution( DVM_CONST_VIRTUAL_WIDTH, DVM_CONST_VIRTUAL_HEIGHT )
	SetOrientationAllowed( 0, 0, 1, 1 ) // landscape only
	SetSyncRate( DVM_CONST_SYNC_RATE, 0 )
	SetScissor( 0,0,0,0 )
	UseNewDefaultFonts( 1 )
endfunction

function DVM_GameSetup()
	DVM_InputHandler_Setup()
	
	scene as Scene
	scene = DVM_TestScene_CreateSceneObject()
	DVM_SceneManager_PushScene(scene)
	
	scene = DVM_TestScene2_CreateSceneObject()
	DVM_SceneManager_PushScene(scene)
endfunction