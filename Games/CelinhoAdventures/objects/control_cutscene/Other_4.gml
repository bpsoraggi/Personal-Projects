/// @description 
if cutscene_mode = "immediate" {
	cutscene_on = true;
	current_cutscene = cutscene_id;
	
	//Set the camera
	current_camera = view_get_camera(view_camera[view_current]);
	if !done {
		original_object = camera_get_view_target(current_camera);
		done = true;
	}
	if !instance_exists(cutscene_camera) {
		//There might be problems with this, especially when compiling to yyc. I think I have fixed them, but I'm not 100% sure.
		if instance_exists(original_object) {
			instance_create_layer(original_object.x,original_object.y,"hud",cutscene_camera);
		}else{
			instance_create_layer(0,0,"hud",cutscene_camera);
		}
	}
}