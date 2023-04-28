/// @description The cutscene

#region Cutscene mode collision
if cutscene_mode = "collision" {
	if (place_meeting(x,y,cutscene_player) and  enabled == true) {
		cutscene_on = true;
		current_cutscene = cutscene_id;
	
		//Set the camera
		current_camera = view_get_camera(view_camera[view_current]);
		//Get the current camera object so it can be changed back after the cutscene ends (?)
		if !done {
			done = true;
		}
		//Create the new camera
		if !instance_exists(cutscene_camera) {
			//There might be problems with this, especially when compiling to yyc. I think I have fixed them, but I'm not 100% sure.
			if instance_exists(original_object) {
				instance_create_layer(original_object.x,original_object.y,"hud",cutscene_camera);
			}else{
				instance_create_layer(0,0,"hud",cutscene_camera);
			}
		}
	}
}

#endregion

if (cutscene_on and enabled == true) {
	//A variable to know what scene is going in the current cutscene
	var current_scene = scene_info[scene];

	//How many arguments the current scene has
	var len = array_length(current_scene)-1; //it was array_length_1d before

	//Execute the scene with the amount of arguments it has
	switch(len) {
		case 0:
		script_execute(current_scene[0]);
		break;
	
		case 1:
		script_execute(current_scene[0],current_scene[1]);
		break;
	
		case 2:
		script_execute(current_scene[0],current_scene[1],current_scene[2]);
		break;
	
		case 3:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3]);
		break;

		case 4:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4]);
		break;
	
		case 5:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5]);
		break;
		
		case 6:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6]);
		break;
		
		case 7:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7]);
		break;

		case 8:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8]);
		break;
		
		case 9:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9]);
		break;
		
		case 10:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10]);
		break;
		
		case 11:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11]);
		break;
		
		case 12:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[11],current_scene[12]);
		break;
		
		case 13:
		script_execute(current_scene[0],current_scene[1],current_scene[2],current_scene[3],current_scene[4],current_scene[5],current_scene[6],current_scene[7],current_scene[8],current_scene[9],current_scene[10],current_scene[10],current_scene[11],current_scene[12],current_scene[13]);
		break;
		
	}
}