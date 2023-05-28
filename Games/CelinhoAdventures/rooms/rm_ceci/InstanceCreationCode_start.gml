// add variables
cutscene_id = 0; //the first cutscene of the room
cutscene_player = obj_player; //the object that is used for collision checking
cutscene_mode = "immediate"; //another option is "immediate", to start the cutscene immediately
persist = false; //gets deleted when cutscene is over
enabled = true;

// add the scripts
scene_info = [
	
	[cutscene_change_variable, obj_player, "walkSpeed", 0],
	
	[cutscene_fade_in, 1, c_black],
	[cutscene_wait, 3],
	
	[cutscene_create_object, 1170, 820, obj_npc_ceci, "Instances"],
	[cutscene_wait, 2],
	
	[cutscene_set_sprite, obj_npc_ceci, spr_ceci_walk_up],
	[cutscene_move_object, obj_npc_ceci, 1170, 640, 3],
	[cutscene_set_sprite, obj_npc_ceci, spr_ceci_idle_up],
	[cutscene_wait, 2],
	
	[cutscene_create_object, x, y, obj_dialogue, "Dialogues"],
	[cutscene_change_variable, obj_dialogue, "npcName", "ceci"],
	[cutscene_wait, 8],
	[cutscene_set_sprite, obj_npc_ceci, spr_ceci_idle_left],

];