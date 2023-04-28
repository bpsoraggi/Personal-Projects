// add variables
cutscene_id = 0; //the first cutscene of the room
cutscene_player = obj_player; //the object that is used for collision checking
cutscene_mode = "collision"; //another option os "immediate", to start the cutscene immediately
persist = false; //gets deleted when cutscene is over
enabled = false;

// add the scripts
scene_info = [
	
	[cutscene_change_variable, obj_player, "walkSpeed", 0],
	[cutscene_wait, 2],
	
	[cutscene_set_sprite, obj_npc_mik, spr_player_idle_up],
	[cutscene_create_object, 1920, 1472, obj_npc_mik],
	[cutscene_draw_sprite, spr_gui_prompt_all01, 1, 1920, 1420],
	[cutscene_wait, 2],
	
	[cutscene_create_object, x, y, obj_dialogue, "Dialogues"],
	[cutscene_change_variable, obj_dialogue, "npcName", "mik"],
	
];