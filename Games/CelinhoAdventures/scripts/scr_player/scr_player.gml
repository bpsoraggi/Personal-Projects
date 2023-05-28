// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//===================== COLLISION =====================
function scr_player_collision() {
	if place_meeting(x + vx, y, obj_collision) {
		while !place_meeting(x + sign(vx), y, obj_collision) {
			x += sign(vx);
		}
		vx = 0;
	}
	
	x += vx;
	
	if place_meeting(x, y + vy, obj_collision) {
		while !place_meeting(x, y + sign(vy), obj_collision) {
			y += sign(vy);
		}
		vy = 0;
	}
	
	y += vy;
}

//===================== WALKING =====================
function scr_player_walking(){
	
	#region movement
	// check keys for movement
	if (global.dialogue == false and global.move == true) {
		moveRight = keyboard_check(ord("D"));
		moveLeft = keyboard_check(ord("A"));
		moveUp = keyboard_check(ord("W"));
		moveDown = keyboard_check(ord("S"));
	} else if (global.dialogue == true or global.move == false) {
		moveRight = 0;
		moveLeft = 0;
		moveUp = 0;
		moveDown = 0;
	}

	// calculate movement
	vx = ((moveRight - moveLeft) * walkSpeed);
	vy = ((moveDown - moveUp) * walkSpeed);
	
	// if idle
	if (vx == 0 && vy == 0) {
	// change idle sprite based on last direction
		if (verde != 1) {
			switch dir {
				case 0: sprite_index = spr_player_idle_right; break;
				case 1: sprite_index = spr_player_idle_up; break;
				case 2: sprite_index = spr_player_idle_left; break;
				case 3: sprite_index = spr_player_idle_down; break;
			}
		} else {
			switch dir {
				case 0: sprite_index = spr_player_green_idle_right; break;
				case 1: sprite_index = spr_player_green_idle_up; break;
				case 2: sprite_index = spr_player_green_idle_left; break;
				case 3: sprite_index = spr_player_green_idle_down; break;
			}
		}
	}

	// if moving
	if (vx != 0 || vy != 0) {
		if !collision_point(x+vx, y, obj_collision, true, true) {
			x += vx;
		}
	
		if !collision_point(x, y+vy, obj_collision, true, true) {
			y += vy;
		}
	
		if (walkSpeed > 5) {
			walkSpeed = 5;
		}
	
		// change walking sprite based on direction
		if (verde != 1) {
			if (vx > 0) {
				sprite_index = spr_player_walk_right;
				dir = 0;
			}
	
			if (vx < 0) {
				sprite_index = spr_player_walk_left;
				dir = 2;
			}
	
			if (vy > 0) {
				sprite_index = spr_player_walk_down;
				dir = 3;
			}
	
			if (vy < 0) {
				sprite_index = spr_player_walk_up;
				dir = 1;
			}
		} else {
			if (vx > 0) {
				sprite_index = spr_player_green_walk_right;
				dir = 0;
			}
	
			if (vx < 0) {
				sprite_index = spr_player_green_walk_left;
				dir = 2;
			}
	
			if (vy > 0) {
				sprite_index = spr_player_green_walk_down;
				dir = 3;
			}
	
			if (vy < 0) {
				sprite_index = spr_player_green_walk_up;
				dir = 1;
			}
		}
	}
	#endregion
	
	#region dash
	if (stamina >= 10) {
		if mouse_check_button_pressed(mb_right) {
			stamina -= 10;
			alarm[1] = 180;
			alarm[0] = 12;
			dashDir = point_direction(x, y, mouse_x, mouse_y);
			state = scr_player_dash;
		}
	}
	#endregion
	
	#region attack
	if mouse_check_button(mb_left) {
		ds_list_clear(enemies_hit);
		image_index = 0;
		
		switch dir {
			case 0:
				sprite_index = spr_player_fight_right;
				mask = spr_player_fight_right_hb;
			break;
			case 1:
				sprite_index = spr_player_fight_up;
				mask = spr_player_fight_up_hb;
			break;
			case 2:
				sprite_index = spr_player_fight_left;
				mask = spr_player_fight_left_hb;
			break;
			case 3:
				sprite_index = spr_player_fight_down;
				mask = spr_player_fight_down_hb;
			break;
		}
		
		state = scr_player_attacking;
	}
	#endregion

	if (hp <= 0) {
		state = scr_player_dead;
	}
}

//===================== DASH =====================
function scr_player_dash() {
	takeDamage = false;
	
	vx = lengthdir_x(dashSpeed, dashDir);
	vy = lengthdir_y(dashSpeed, dashDir);
	
	scr_player_collision();
	
	var _inst = instance_create_layer(x, y, "Instances", obj_dash);
	_inst.sprite_index = sprite_index;
	
}

//===================== ATTACK =====================
function scr_player_attacking() {
	mask_index = asset_get_index("mask");
	//list to check enemies hit in each frame
	var enemies_in_hitbox = ds_list_create();
	//place enemyIDs inside list
	var enemies = instance_place_list(x, y, par_enemies, enemies_in_hitbox, false);
	
	//if enemy is hit
	if (enemies > 0) {
		//use for loop to check each hit enemy's ID
		for (var i = 0; i < enemies; i++) {
			var enemyID = enemies_in_hitbox[| i];
			
			//compare enemyID in local list to player's hit enemy list
			if (ds_list_find_index(enemies_hit, enemyID)) == -1 {
				ds_list_add(enemies_hit, enemyID);
				
				with(enemyID) {
					hp -= obj_player.damage;
					var _dir = point_direction(obj_player.x, obj_player.y, other.x, other.y);
					pushDir = _dir;
					pushSpeed = 6
					if (object_index != obj_boss) {
						state = scr_enemy_hit;
					}
					
					//duration of knockback
					alarm[1] = 14;
					hit = true;
					
					var _inst = instance_create_layer(x, y, "Instances", obj_damage);
					_inst.target = other;
					_inst.damage = obj_player.damage;
				}
			}
		}
	}
	
	ds_list_destroy(enemies_in_hitbox);
	mask_index = spr_player_idle_down;
	
	if image_index >= 3 {
		if mouse_check_button_pressed(mb_left)	{
		}
	}
	
	if end_of_animation() {
		state = scr_player_walking;
		attack = false;
	}
}

//===================== HIT =====================
function scr_player_hit() {
	if alarm[2] > 0 {
		pushSpeed = lerp(pushSpeed, 0, 0.05);
		
		vx = lengthdir_x(pushSpeed, pushDir);
		vy = lengthdir_y(pushSpeed, pushDir);
	
		scr_player_collision();
	} else {
		state = scr_player_walking;
	}
}

//===================== DEAD =====================
function scr_player_dead() {
	
	if (image_angle != -90) {
		image_angle -= 5;
	}
	
	timer--;
	
	if (timer <= 0) {
		timer = 120;
	
		if !instance_exists(obj_fade) {
			fade_to_room(rm_gameMain, 60, c_black);
		}
	}
}
