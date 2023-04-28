/// @description For draw functions

//Draw rectangle
if rect == true {
    draw_set_color(effect_color);
	draw_set_alpha(effect_alpha);
    draw_rectangle(0,0,room_width,room_height,false);
}
//Draw rectangle with effect
if rect_ef == true {
    draw_set_color(effect_color);
	draw_set_alpha(0.1);
    draw_rectangle(0,0,room_width,room_height,false);
	gpu_set_blendmode(bm_subtract);
}

//Draw line
if line == true {
	draw_set_color(color);
	//draw_set_alpha(effect_alpha);
	draw_line(line_x1,line_y1,line_x2,line_y2);
	//draw_set_alpha(1);
}

//Draw sprite
if drawsprite == true {
	draw_sprite_ext(spr,spr_subimg,spr_x,spr_y,spr_xscale,spr_yscale,spr_rot,spr_col,spr_alpha);
}

//Draw fade in and out effects
if fade_out == true {
	draw_set_alpha(timer);
	draw_set_color(fade_color);
	if view_enabled {
		draw_rectangle(0,0,camera_get_view_width(view_camera[view_current]),camera_get_view_height(view_camera[view_current]),false);
	}else{
		draw_rectangle(0,0,room_width,room_height,false);
	}
}

if fade_in == true {
	//show_debug_message(string(fade_in))
	draw_set_alpha(1-timer);
	draw_set_color(fade_color);
	if view_enabled {
		draw_rectangle(0,0,camera_get_view_width(view_camera[view_current]),camera_get_view_height(view_camera[view_current]),false);
	}else{
		draw_rectangle(0,0,room_width,room_height,false);
	}
}

draw_set_alpha(1);