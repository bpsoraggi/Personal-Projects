/// @description effects

draw_self();

if alarm[3] > 0 {
	if image_alpha >= 1 {
		damage_alpha = -0.05;
	} else if image_alpha <= 0 {
		damage_alpha = 0.05;
	}
	
	if hp > 0 {
		image_alpha += damage_alpha;
	} else {
		image_alpha = 1;
	}
} else {
	image_alpha = 1;	
}