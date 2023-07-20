
#include "includes.agc"

// Function Definitions
function DVM_HandleInput()
	DVM_InputHandler_InputDataUpdate()
endfunction
	
function DVM_HandlePhysicsUpdate()
	
endfunction
	
function DVM_HandleUpdate()
	
endfunction

function DVM_HandleDraw()
	
endfunction
	
function DVM_GameCleanup()
	
endfunction

// Setup game.
DVM_EngineSetup()
DVM_GameSetup()

// Begin game loop.
do
    Print( ScreenFPS() )
    
    DVM_HandleInput()
    DVM_HandlePhysicsUpdate()
    DVM_HandleUpdate()
    DVM_HandleDraw()
    
    Sync()
loop

// Cleanup game.
DVM_GameCleanup()


