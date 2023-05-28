/// @description Fade

if (state == 0) {
	timer++;
	
	if (timer >= duration) {
		room_goto(targetRoom);
		obj_player.x = xx;
		obj_player.y = yy;
		
		state = 1;
		obj_player.image_angle = 0;
		obj_player.hp = obj_player.maxHp;
		obj_player.state = scr_player_walking;
	}
} else if (state == 1) {
	timer--;
	
	if (timer <= 0) {
		instance_destroy();
	}
}

alpha = timer/duration;