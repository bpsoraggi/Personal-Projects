/// @description Example speech bubble on another object
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		
		//Make a speech bubble
		if !sbubble_exists() {
			sbubble_create("Stop speaking to him!","Speak to me!");
			//This time we put the speech bubble to the npc1 and not to this object...
			sbubble_set(noone,c_white,c_black,1,example_font,25,250,example_npc1);
		}
	}
}


depth = -y;