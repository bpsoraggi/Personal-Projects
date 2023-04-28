//Cutscene_id must be different for all the cutscene objects in the same room
cutscene_id = 1;
//Cutscene object will check collision for cutscene_player object
cutscene_player = example_player;
//Collision will make the cutscene start when the "cutscene_player" object collides with this object
cutscene_mode = "collision";
//If this object should be destroyed at the end or not
persist = true;

//In this 2d array is stored the cutscene information, scripts and their arguments in an order
scene_info = [
	[cutscene_play_sound,sound_alarm,1],
	[cutscene_screen_color,c_red,0.6,0.3],
	[cutscene_wait,0.3],
	[cutscene_play_sound,sound_alarm,1],
	[cutscene_screen_color,c_red,0.6,0.3],
	[cutscene_wait,0.3],
	[cutscene_play_sound,sound_alarm,1],
	[cutscene_screen_color,c_red,0.6,0.3],
	[cutscene_wait,0.3],
	[cutscene_play_sound,sound_alarm,1],
	[cutscene_screen_color,c_red,0.6,0.3],
	[cutscene_dialogue_style,noone,c_black,c_white,c_white,1,example_font,noone,true,example_continue1,30,true],
	[cutscene_dialogue,"You went too far.","Do not touch me!"],
	[cutscene_move_object,example_player,170,300,2]
];