
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
    
    /*
    Print( DVM_InputHandler_Data.up )
    Print( DVM_InputHandler_Data.down )
    Print( DVM_InputHandler_Data.left )
    Print( DVM_InputHandler_Data.right )
    Print( DVM_InputHandler_Data.pause )
    Print( DVM_InputHandler_Data.confirm )
    Print( DVM_InputHandler_Data.cancel )
    Print( DVM_InputHandler_Data.pointer )
    Print( DVM_InputHandler_Data.pointerPosX )
    Print( DVM_InputHandler_Data.pointerPosY )
    */
    
    
    Sync()
loop

// Cleanup game.
DVM_GameCleanup()


