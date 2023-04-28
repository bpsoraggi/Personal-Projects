/// @description Damage player

if other.takeDamage == true {
	var _dir = point_direction(x, y, other.x, other.y);

	with (other) {
		pushDir = _dir;
		state = scr_player_hit;
	
		//length of knockback
		alarm[2] = 15;
		//damage cooldown time
		alarm[3] = 180;
		pushSpeed = 10;
		takeDamage = false;
		hp -= 10;
	}
	
	var _inst = instance_create_layer(x, y, "Instances", obj_damage);
	_inst.target = other;
	_inst.damage = 2;
}