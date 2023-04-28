//Check if cutscene has been seen
ini_open("savedata.ini");
var s = ini_read_real("cutscenes","cutscene_seen1",false);
ini_close();
if s = true {
	instance_destroy();
}

//file_delete("savedata.ini"); //This is just for testing

//Different cutscene_id must be set to all the control_cutscene objects in the room
cutscene_id = 0;
//Cutscene object will check collision for cutscene_player object
cutscene_player = example_player;
//Immediate will make the cutscene start when the room starts
cutscene_mode = "immediate";
//If this object should be destroyed at the end or not
persist = false;

//Put the scripts and arguments on scene_info 2d array
scene_info = [
	[cutscene_wait,1],
	[cutscene_camera_shake_start,5],
	[cutscene_camera_follow_object,example_player,5],
	[cutscene_move_object,example_npc2,350,140,2],
	[cutscene_move_object,example_player,325,200,1],
	[cutscene_dialogue_style,noone,c_blue,c_white,c_blue,0.7,example_font,noone,true,noone],
	[cutscene_dialogue_options,c_blue,0,"I don't know!","I think it's stopping..."],
	[cutscene_dialogue,"What's going on????"],
	[cutscene_wait,1],
	[cutscene_camera_shake_stop],
	[cutscene_save_value,"savedata.ini","real","cutscenes","cutscene_seen1",true]
];