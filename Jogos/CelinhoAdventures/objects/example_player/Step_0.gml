///@description Moving

//Don't move if speaking
if !instance_exists(sbubble) {
	//Move with arrow keys
	if keyboard_check(vk_up) {
		y -= 4;
	}
	if keyboard_check(vk_down) {
		y += 4;
	}
	if keyboard_check(vk_right) {
		x += 4;
	}
	if keyboard_check(vk_left) {
		x -= 4;
	}

	//Stop moving
	if keyboard_check_released(vk_up) {
		y += 0;
	}
	if keyboard_check_released(vk_down) {
		y += 0;
	}
	if keyboard_check_released(vk_right) {
		x += 0;
	}
	if keyboard_check_released(vk_left) {
		x += 0;
	}

}


//This does that the object is under others if they are in front of it.
//But if there is a textbox the object would be in front of it, so we disable this when textbox exists.
if !instance_exists(sbubble) {
	depth = -y;
}else{
	depth = 0;
}