//Cutscene_id must be different for all the cutscene objects in the same room
cutscene_id = 2;
//Cutscene object will check collision for cutscene_player object
cutscene_player = example_player;
//Collision will make the cutscene start when the "cutscene_player" object collides with this object
cutscene_mode = "collision";
//If this object should be destroyed at the end or not
persist = false;

//Put the scripts and arguments on scene_info 2d array
scene_info = [
	[cutscene_dialogue_style_bubble,noone,c_blue,c_white,0.8,example_font,20,230,example_npc2,true,noone],
	[cutscene_dialogue_options,c_maroon,1,"To... your home!","To the shop."],
	[cutscene_dialogue_change_message,2,"Don't go there! Noooooooooooooo.","Ok. Have a good time there."],
	[cutscene_dialogue_bubble,"Hey!", "Where are you going?","Don't go there! Noooooooooooooo."],
	[cutscene_camera_follow_object,example_player,10],
	[cutscene_move_object,example_player,670,150,3]
];