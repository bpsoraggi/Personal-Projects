// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_boss_choose_attack(){
	if (alarm[0] <= 0) {
		var _attack = choose(scr_boss_attack1, scr_boss_attack2);
		state = _attack;
		alarm[0] = 240;
	}
	
}

function scr_boss_attack1() {
	var _dir = 0;
	
	repeat(8) {
		var _inst = instance_create_layer(x, y, "Instances", obj_boss_projectile);
		_inst.speed = 2;
		_inst.direction = _dir;
		
		_dir += 45;
	}
	
	state = scr_boss_choose_attack;
}

function scr_boss_attack2() {
	repeat (6) {
		var _xx = irandom_range(x - 300, x + 300);	
		var _yy = irandom_range(y - 300, y + 300);
		
		instance_create_layer(_xx, _yy, "Instances", obj_boss_attack1);
	}
	
	state = scr_boss_choose_attack;
}