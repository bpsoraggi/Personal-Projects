/// @description Fade

if (state == 0) {
	timer++;
	
	if (timer >= duration) {
		room_goto(targetRoom);
		obj_ceu.x = xx;
		obj_ceu.y = yy;
		
		state = 1;
		obj_ceu.image_angle = 0;
	}
} else if (state == 1) {
	timer--;
	
	if (timer <= 0) {
		instance_destroy();
	}
}

alpha = timer/duration;