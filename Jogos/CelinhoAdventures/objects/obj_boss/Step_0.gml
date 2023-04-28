/// @description Follow path

script_execute(state);

if (hp > 0) {
    if x > obj_player.x {
		sprite_index = spr_domin_left
	} else {
		sprite_index = spr_domin_right;
	}
}
else {
    if (sprite_index != spr_domin_death) {
        image_index = 0;
        sprite_index = spr_domin_death;
    }

    if (end_of_animation()) {
		if (instance_exists(obj_courier)) {
			obj_courier.bossCutscene = true;
		}
		
		bossDeathTrigger.enabled = true;
        instance_destroy();
    }
}