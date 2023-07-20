// File: scene.agc
// Created: 23-07-20
type Scene
	id as integer
	
	sprites as integer[]
	texts as integer[]
	buttons as integer[]
	editBoxes as integer[]
	particles as integer[]
	
	sceneItems as SceneItem[]
endtype

type SceneItem
	id as integer
	active as integer
	visible as integer
	sceneItemType as integer
endtype

function DVM_Scene_StoreScene(scene ref as Scene)
	scene.sceneItems.length = -1
	
	DVM_Scene_CreateSpriteSceneArray(scene.sprites, scene.sceneItems)
	DVM_Scene_CreateTextSceneArray(scene.texts, scene.sceneItems)
	DVM_Scene_CreateButtonSceneArray(scene.buttons, scene.sceneItems)
	DVM_Scene_CreateEditBoxSceneArray(scene.editBoxes, scene.sceneItems)
	DVM_Scene_CreateParticleSceneArray(scene.particles, scene.sceneItems)
endfunction

function DVM_Scene_DestroyScene(scene ref as Scene)
	
	DVM_Scene_StoreScene(scene)
	
	sceneItem as SceneItem
	
	for i = 0 to scene.sceneItems.length
		sceneItem = scene.sceneItems[i]
		
		select(sceneItem.sceneItemType)
			case DVM_CONST_SCENE_SPRITE_TYPE:
				if GetSpriteExists(sceneItem.id) then DeleteSprite(sceneItem.id)
			endcase
			case DVM_CONST_SCENE_TEXT_TYPE:
				if GetTextExists(sceneItem.id) then DeleteText(sceneItem.id)
			endcase
			case DVM_CONST_SCENE_BUTTON_TYPE:
				//May not be suitable for all games.
				//But logic can be used afterwards to disable a button if required.
				if GetVirtualButtonExists(sceneItem.id) then DeleteVirtualButton(sceneItem.id)
			endcase
			case DVM_CONST_SCENE_EDIT_BOX_TYPE:
				if GetEditBoxExists(sceneItem.id) then DeleteEditBox(sceneItem.id)
			endcase
			case DVM_CONST_SCENE_PARTICLE_TYPE:
				if GetParticlesExists(sceneItem.id) then DeleteParticles(sceneItem.id)
			endcase
		endselect
	next i
endfunction

function DVM_Scene_HideScene(scene ref as Scene)
	
	DVM_Scene_StoreScene(scene)
	
	sceneItem as SceneItem
	
	for i = 0 to scene.sceneItems.length
		sceneItem = scene.sceneItems[i]
		
		select(sceneItem.sceneItemType)
			case DVM_CONST_SCENE_SPRITE_TYPE:
				if GetSpriteExists(sceneItem.id)
					SetSpriteVisible(sceneItem.id, 0)
					SetSpriteActive(sceneItem.id, 0)
				endif
			endcase
			case DVM_CONST_SCENE_TEXT_TYPE:
				if GetTextExists(sceneItem.id)
					SetTextVisible(sceneItem.id, 0)
				endif
			endcase
			case DVM_CONST_SCENE_BUTTON_TYPE:
				if GetVirtualButtonExists(sceneItem.id)
					//May not be suitable for all games.
					//But logic can be used afterwards to disable a button if required.
					SetVirtualButtonActive(sceneItem.id, 0)
					SetVirtualButtonVisible(sceneItem.id, 0)
				endif
			endcase
			case DVM_CONST_SCENE_EDIT_BOX_TYPE:
				if GetEditBoxExists(sceneItem.id)
					SetEditBoxActive(sceneItem.id, 0)
					SetEditBoxVisible(sceneItem.id, 0)
				endif
			endcase
			case DVM_CONST_SCENE_PARTICLE_TYPE:
				if GetParticlesExists(sceneItem.id)
					SetParticlesActive(sceneItem.id, 0)
					SetParticlesVisible(sceneItem.id, 0)
				endif
			endcase
		endselect
	next i
endfunction

function DVM_Scene_RestoreScene(scene ref as Scene)
	
	sceneItem as SceneItem
	
	for i = 0 to scene.sceneItems.length
		sceneItem = scene.sceneItems[i]
		
		select(sceneItem.sceneItemType)
			case DVM_CONST_SCENE_SPRITE_TYPE:
				if GetSpriteExists(sceneItem.id)
					SetSpriteVisible(sceneItem.id, sceneItem.visible)
					SetSpriteActive(sceneItem.id, sceneItem.active)
				endif
			endcase
			case DVM_CONST_SCENE_TEXT_TYPE:
				if GetTextExists(sceneItem.id)
					SetTextVisible(sceneItem.id, sceneItem.visible)
				endif
			endcase
			case DVM_CONST_SCENE_BUTTON_TYPE:
				//May not be suitable for all games.
				//But logic can be used afterwards to disable a button if required.
				if GetVirtualButtonExists(sceneItem.id)
					SetVirtualButtonActive(sceneItem.id, 1)
					SetVirtualButtonVisible(sceneItem.id, 1)
				endif
			endcase
			case DVM_CONST_SCENE_EDIT_BOX_TYPE:
				if GetEditBoxExists(sceneItem.id)
					SetEditBoxActive(sceneItem.id, sceneItem.active)
					SetEditBoxVisible(sceneItem.id, sceneItem.visible)
				endif
			endcase
			case DVM_CONST_SCENE_PARTICLE_TYPE:
				if GetParticlesExists(sceneItem.id)
					SetParticlesActive(sceneItem.id, sceneItem.active)
					SetParticlesVisible(sceneItem.id, sceneItem.visible)
				endif
			endcase
		endselect
	next i
endfunction

//Convert Arrays into Scene Item Arrays
function DVM_Scene_CreateSpriteSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetSpriteExists(input[i]) then continue
		
		sceneItem = DVM_Scene_CreateSpriteSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function DVM_Scene_CreateTextSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetTextExists(input[i]) then continue
			
		sceneItem = DVM_Scene_CreateTextSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function DVM_Scene_CreateEditBoxSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetEditBoxExists(input[i]) then continue
		
		sceneItem = DVM_Scene_CreateEditBoxSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function DVM_Scene_CreateParticleSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetParticlesExists(input[i]) then continue
		
		sceneItem = DVM_Scene_CreateParticleSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

function DVM_Scene_CreateButtonSceneArray(input as integer[], output ref as SceneItem[])
	sceneItem as SceneItem
	
	for i = 0 to input.length
		if not GetVirtualButtonExists(input[i]) then continue
		
		sceneItem = DVM_Scene_CreateButtonSceneItem(input[i])
		output.insert(sceneItem)
	next i
endfunction

// Create Single Scene Items
function DVM_Scene_CreateSpriteSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active =  GetSpriteActive(item)
	sceneItem.visible =  GetSpriteVisible(item)
	sceneItem.sceneItemType = DVM_CONST_SCENE_SPRITE_TYPE
endfunction sceneItem

function DVM_Scene_CreateTextSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active = 1
	sceneItem.visible =  GetTextVisible(item)
	sceneItem.sceneItemType = DVM_CONST_SCENE_TEXT_TYPE
endfunction sceneItem

function DVM_Scene_CreateEditBoxSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active = GetEditBoxActive(item)
	sceneItem.visible =  GetEditBoxVisible(item)
	sceneItem.sceneItemType = DVM_CONST_SCENE_EDIT_BOX_TYPE
endfunction sceneItem

function DVM_Scene_CreateParticleSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active =  GetParticlesActive(item)
	sceneItem.visible =  GetParticlesVisible(item)
	sceneItem.sceneItemType = DVM_CONST_SCENE_PARTICLE_TYPE
endfunction sceneItem

function DVM_Scene_CreateButtonSceneItem(item as integer)
	sceneItem as SceneItem
	sceneItem.id = item
	sceneItem.active = 1
	sceneItem.visible = 1
	sceneItem.sceneItemType = DVM_CONST_SCENE_BUTTON_TYPE
endfunction sceneItem