/// @description Draw self

if (destX < x) {
	xScale = -1;
} else {
	xScale = 1;
}

if hit == true {
	gpu_set_fog(true, c_white, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, xScale, image_yscale, image_angle, image_blend, image_alpha);
	gpu_set_fog(false, c_white, 0, 0);
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, xScale, image_yscale, image_angle, image_blend, image_alpha);	
}