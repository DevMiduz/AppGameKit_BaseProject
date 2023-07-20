// File: input_handler.agc
// Created: 23-07-20

type DVM_InputData
	up as integer
	down as integer
	left as integer
	right as integer
	pointer as integer
	pointerPosX as integer
	pointerPosY as integer	
	pause as integer
	confirm as integer
	cancel as integer
endtype

type DVM_InputBindings
	up as integer[] 
	down as integer[]
	left as integer[]
	right as integer[]
	pause as integer[]
	confirm as integer[]
	cancel as integer[]
endtype

global DVM_InputHandler_Data as DVM_InputData
global DVM_InputHandler_InputBindings as DVM_InputBindings

function DVM_InputHandler_Setup()
	DVM_InputHandler_InputBindings.up = [KEY_UP, KEY_W]
	DVM_InputHandler_InputBindings.down = [KEY_DOWN, KEY_S]
	DVM_InputHandler_InputBindings.left = [KEY_LEFT, KEY_A]
	DVM_InputHandler_InputBindings.right = [KEY_RIGHT, KEY_D]
	DVM_InputHandler_InputBindings.pause = [KEY_ESCAPE]
	DVM_InputHandler_InputBindings.confirm = [KEY_ENTER]
	DVM_InputHandler_InputBindings.cancel = [KEY_ESCAPE]
endfunction

function DVM_InputHandler_InputDataUpdate()
	DVM_InputHandler_UpdateUp()
	DVM_InputHandler_UpdateDown()
	DVM_InputHandler_UpdateLeft()
	DVM_InputHandler_UpdateRight()
	DVM_InputHandler_UpdatePause()
	DVM_InputHandler_UpdateConfirm()
	DVM_InputHandler_UpdateCancel()
	
	DVM_InputHandler_UpdatePointer()
	DVM_InputHandler_UpdatePointerPosition()
	
endfunction DVM_InputHandler_Data

function DVM_InputHandler_UpdateUp()
	DVM_InputHandler_Data.up = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.up)
endfunction

function DVM_InputHandler_UpdateDown()
	DVM_InputHandler_Data.down = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.down)
endfunction

function DVM_InputHandler_UpdateLeft()
	DVM_InputHandler_Data.left = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.left)
endfunction

function DVM_InputHandler_UpdateRight()
	DVM_InputHandler_Data.right = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.right)
endfunction

function DVM_InputHandler_UpdatePause()
	DVM_InputHandler_Data.pause = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.pause)
endfunction

function DVM_InputHandler_UpdateConfirm()
	DVM_InputHandler_Data.confirm = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.confirm)
endfunction

function DVM_InputHandler_UpdateCancel()
	DVM_InputHandler_Data.cancel = DVM_InputHandler_UpdateKeyBinding(DVM_InputHandler_InputBindings.cancel)
endfunction

function DVM_InputHandler_UpdatePointer()
	DVM_InputHandler_Data.pointer = DVM_InputHandler_UpdatePointerState()
endfunction

function DVM_InputHandler_UpdatePointerPosition()
	DVM_InputHandler_Data.pointerPosX = GetPointerX()
	DVM_InputHandler_Data.pointerPosY = GetPointerY()
endfunction

function DVM_InputHandler_UpdateKeyBinding(inputBindings as integer[])
	keyOutput as integer
	prevKeyOutput as integer
	keyBinding as integer 
	
	for i = 0 to inputBindings.length
		keyBinding = inputBindings[i]
		
		prevKeyOutput = keyOutput
		keyOutput = DVM_InputHandler_UpdateKeyState(keyBinding)
		
		if(prevKeyOutput = DVM_CONST_INPUT_HELD)
			keyOutput = prevKeyOutput
		endif
	next i
endfunction keyOutput

function DVM_InputHandler_UpdatePointerState()

	if(GetPointerPressed() = 1)
		exitfunction DVM_CONST_INPUT_PRESSED
	elseif(GetPointerState() = 1)
		exitfunction DVM_CONST_INPUT_HELD
	elseif(GetPointerReleased() = 1)
		exitfunction DVM_CONST_INPUT_RELEASED
	endif
	
endfunction DVM_CONST_INPUT_IDLE

function DVM_InputHandler_UpdateKeyState(inputKey as integer)

	if(GetRawKeyPressed(inputKey) = 1)
		exitfunction DVM_CONST_INPUT_PRESSED
	elseif(GetRawKeyState(inputKey) = 1)
		exitfunction DVM_CONST_INPUT_HELD
	elseif(GetRawKeyReleased(inputKey) = 1)
		exitfunction DVM_CONST_INPUT_RELEASED
	endif
	
endfunction DVM_CONST_INPUT_IDLE