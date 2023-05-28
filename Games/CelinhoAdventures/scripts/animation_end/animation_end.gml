/// @function animation_end()
/// @description Checks when animation ends - Will be used for future cutscene_draw_animation or similar scripts

function animation_end(){
	return (image_index + image_speed * 
	sprite_get_speed(sprite_index) / 
	(sprite_get_speed_type(sprite_index) == 
	spritespeed_framespergameframe ? 1 : 
	game_get_speed(gamespeed_fps)) >= 
	image_number);   
}
