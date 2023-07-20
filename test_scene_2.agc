// File: test_scene_2.agc
// Created: 23-07-20

function DVM_TestScene2_CreateSceneObject()
	test_scene_2_setup()
	
	scene as Scene
	scene.id = DVM_CONST_TEST_SCENE_2
	scene.sprites = test_scene_2_sprites
	scene.texts = test_scene_2_text
	
endfunction scene