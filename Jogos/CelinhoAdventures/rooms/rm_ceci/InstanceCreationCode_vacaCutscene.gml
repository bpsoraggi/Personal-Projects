// add variables
cutscene_id = 0; //the first cutscene of the room
cutscene_player = obj_player; //the object that is used for collision checking
cutscene_mode = "collision"; //another option is "immediate", to start the cutscene immediately
persist = false; //gets deleted when cutscene is over
enabled = true;

// add the scripts
scene_info = [
	
	[cutscene_change_variable, obj_player, "walkSpeed", 0],
	[cutscene_wait, 1],
	
	[fade_to_room3, rm_vaca, 60, c_black],
	
	//[fade_to_room2, rm_vaca, 60, c_black, 450, 990, obj_fade2],

];