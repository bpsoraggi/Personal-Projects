/// @description Example advanced speech bubble

//if first time
if spoke = false {
	//Create the speech bubble when player is near
	if distance_to_object(example_player)<100 {
		if !sbubble_exists() {
			sbubble_create("STOP!!!!!!","Stop right there you... you... um...","You suspicious looking guy who clearly has no idea what he is getting involved to.","Go away.");
			sbubble_set(noone,c_dkgray,c_white,1,example_font,25,300,example_npc5);
			sbubble_set_speed(0.5,1,0.2,0.1);
			spoke = true;
		}
	}
}else{
	//Create the speech bubble normally
	if keyboard_check_pressed(vk_space) {
		if place_meeting(x,y,example_player) {
			if !sbubble_exists() {
				sbubble_create("Go away!");
				sbubble_set(noone,c_dkgray,c_white,1,example_font,25,300,example_npc5);
				sbubble_set_speed(0.5);
			}
		}
	}
}


depth = -y;