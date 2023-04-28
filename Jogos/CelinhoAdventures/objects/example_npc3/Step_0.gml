/// @description Example speech bubble with options
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		
		//Make a speech bubble
		if !sbubble_exists() {
			sbubble_create("There are options in speech bubbles!","I'm sooooooooo happy!","YAY!");
			sbubble_set("James",c_black,c_white,1,example_font,25,300,example_npc3);
			sbubble_add_options(c_black,1,"Yay!","AAFKfAF!!!!");
			sbubble_change_message_according_option(1,2,"YAY!","???????????");
		}
	}
}


depth = -y;