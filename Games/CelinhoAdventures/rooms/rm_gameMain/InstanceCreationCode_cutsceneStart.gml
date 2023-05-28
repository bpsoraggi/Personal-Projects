// add variables
cutscene_id = 0; //the first cutscene of the room
cutscene_player = obj_player; //the object that is used for collision checking
cutscene_mode = "immediate"; //another option is "immediate", to start the cutscene immediately
persist = false; //gets deleted when cutscene is over
enabled = true;

// add the scripts
scene_info = [
	
	//show portal and player
	
	[cutscene_wait, 1],
	[cutscene_create_object, 288, 270, obj_portal2],
	[cutscene_wait, 2],
	[cutscene_create_object, 288, 352, obj_ceu],
	
	//delete portal
	[cutscene_wait, 1],
	[cutscene_destroy_object, obj_portal2],
	[cutscene_change_variable, obj_player, "x", 288],
	[cutscene_change_variable, obj_player, "y", 352],
	//[cutscene_create_object, 288, 352, obj_player],
	[cutscene_destroy_object, obj_ceu],
	[cutscene_change_variable, obj_control, "delete_cutscene", true],

];