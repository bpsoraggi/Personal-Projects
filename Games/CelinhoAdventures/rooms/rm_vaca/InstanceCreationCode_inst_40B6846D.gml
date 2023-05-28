// add variables
cutscene_id = 0; //the first cutscene of the room
cutscene_player = obj_player; //the object that is used for collision checking
cutscene_mode = "immediate"; //another option is "immediate", to start the cutscene immediately
persist = false; //gets deleted when cutscene is over
enabled = true;

// add the scripts
scene_info = [
	
	[cutscene_destroy_object, obj_player],
	
	//player moving
	[cutscene_wait, 2],
	[cutscene_set_sprite, obj_ceu, spr_player_walk_up],
	[cutscene_move_object, obj_ceu, 255, 645, 3],
	[cutscene_set_sprite, obj_ceu, spr_player_idle_up],
	
	//cow moving
	[cutscene_set_sprite, obj_madCow, spr_cow2_walk_down],
	[cutscene_move_object, obj_madCow, 640, 755, 2],
	[cutscene_set_sprite, obj_madCow, spr_cow2_idle_down],
	[cutscene_wait, 1],
	
	//player looking around
	[cutscene_wait, 1],
	[cutscene_set_sprite, obj_ceu, spr_player_idle_right],
	
	//lola?
	[cutscene_draw_sprite, spr_blola, 2, 355, 610],
	[cutscene_set_sprite, obj_ceu, spr_player_idle_left],
	
	//!!
	[cutscene_wait, 1],
	[cutscene_set_sprite, obj_madCow, spr_cow2_idle_left],
	[cutscene_wait, 1],
	[cutscene_draw_sprite, spr_gui_prompt_all01, 1, 620, 640],
	[cutscene_wait, 1],
	[cutscene_move_object, obj_madCow, 245, 730, 5],
	
	//player hitting tree
	[cutscene_move_object, obj_ceu, 100, 730, 7],
	[cutscene_wait, 2],
	[fade_to_room3, rm_gameMain, 60, c_black],
	

];