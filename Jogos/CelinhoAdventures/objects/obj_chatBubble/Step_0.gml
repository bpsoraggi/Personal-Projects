/// @description Insert description here
// You can write your code in this editor

if (destroy == true) {
	fade -= 0.4;
	
	image_alpha = fade;
	
	if (fade <= 0) {
		instance_destroy();
	}
}