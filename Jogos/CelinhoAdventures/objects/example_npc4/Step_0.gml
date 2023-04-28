/// @description Example speech bubble with options and changing variables

//Change a variable depending on the option the player chooses.
//We check the collision only to know if the player is speaking with this npc. This way the variable won't change when talking to others.
if place_meeting(x,y,example_player) {
	if chooses_option() = 1 {
		with(example_player) {
			money += 50;
		}
	}else if chooses_option() = 2 {
		with(example_player) {
			money += 10;
		}
	}
}


//Create the speech bubble
if keyboard_check_pressed(vk_space) {
	if place_meeting(x,y,example_player) {
		if !sbubble_exists() {
			sbubble_create("You look poor. Here, take some money.","Take care, poor beggar.");
			sbubble_set("Rich guy",c_dkgray,c_white,1,example_font,25,500,example_npc4);
			sbubble_add_options(c_black,0,"YES!!!!","Ok, but only a little bit.");
		}
	}
}



depth = -y;