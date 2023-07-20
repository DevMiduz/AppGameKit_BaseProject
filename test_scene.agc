// File: test_scene.agc
// Created: 23-07-20

function DVM_TestScene_CreateSceneObject()
	test_scene_setup()
	
	scene as Scene
	scene.id = DVM_CONST_TEST_SCENE
	scene.sprites = test_scene_sprites
	scene.texts = test_scene_text
	
endfunction scene