// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//===================== COLLISION =====================
function scr_enemy_collision() {
	//Horizontal Collision
	for (var i = 0; i < array_length_1d(c_obj); i++)
	{
	    if (place_meeting(x + vx, y, c_obj[i]))
	    {
	        while (!place_meeting(x + sign(vx), y, c_obj[i]))
	        {
	            x += sign(vx);
	        }
	        vx = 0;
	        break;
	    }
	}
	x += vx;
	
	//Vertical Collision
	for (var i = 0; i < array_length_1d(c_obj); i++)
	{
	    if (place_meeting(x, y + vy, c_obj[i]))
	    {
	        while (!place_meeting(x, y + sign(vy), c_obj[i]))
	        {
	            y += sign(vy);
	        }
	        vy = 0;
	        break;
	    }
	}
	y += vy;
}

//===================== CHECK PLAYER =====================
function scr_enemy_check_player() {
	if (distance_to_object(obj_player) <= distAggro) {
			state = scr_enemy_chasing;
	}
}

//===================== CHOOSE STATE =====================
function scr_enemy_choose_state(){
	scr_enemy_check_player();
	
	nextState = choose(scr_enemy_walking, scr_enemy_idle);
	
	if (nextState == scr_enemy_walking) {
		state = scr_enemy_walking;
		destX = irandom_range(352, 3360);
		destY = irandom_range(544, 1696)
		
	} else if (nextState == scr_enemy_idle) {
		state = scr_enemy_idle;
		
	}
}

//===================== WALKING =====================
function scr_enemy_walking(){
	scr_enemy_check_player();
	
	image_speed = 1;
	
	if (distance_to_point(destX, destY) > walkSpeed) {
		var _dir = point_direction(x, y, destX, destY);
		vx = lengthdir_x(walkSpeed, _dir);
		vy = lengthdir_y(walkSpeed, _dir);
	
		scr_enemy_collision();
	} else {
		x = destX;
		y = destY;
	}
}

//===================== IDLE =====================
function scr_enemy_idle(){
	scr_enemy_check_player();
	
	image_speed = 0.5;
}

//===================== CHASING =====================
function scr_enemy_chasing() {
		image_speed = 1.5;
		
		destX = obj_player.x;
		destY = obj_player.y;
		
		var _dir = point_direction(x, y, destX, destY);
		vx = lengthdir_x(chaseSpeed, _dir);
		vy = lengthdir_y(chaseSpeed, _dir);
		
		scr_enemy_collision();
		
		if (distance_to_object(obj_player) >= distDisaggro) {
			state = scr_enemy_choose_state;
			alarm[0] = irandom_range(120, 240);
		}
}

//===================== HIT =====================
function scr_enemy_hit() {
	//lose speed while being pushed
	pushSpeed = lerp(pushSpeed, 0, 0.05);
	
	vx = lengthdir_x(pushSpeed, pushDir);
	vy = lengthdir_y(pushSpeed, pushDir);
	
	scr_enemy_collision();
}