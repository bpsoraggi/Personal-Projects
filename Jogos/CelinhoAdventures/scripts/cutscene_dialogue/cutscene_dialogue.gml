///@function cutscene_dialogue(message1,message2,message3,message4,message5,message6,message7,message8,message9,message10)
///@description Creates a textbox and initializes the variables needed - Set up to 10 messages in the arguments
///@arg message1
///@arg [message2]
///@arg [message3]
///@arg [message4]
///@arg [message5]
///@arg [message6]
///@arg [message7]
///@arg [message8]
///@arg [message9]
///@arg [message10]

function cutscene_dialogue() {

	//Create the textbox (You need a layer called hud to your project. Make sure it's above everything.)
	if !instance_exists(textbox) {
		instance_create_layer(x,y,"hud",textbox);


	with(textbox) {

		///Messages
		var maxmessages = argument_count;
		for (var i = 0; i < maxmessages; i ++;) {
		   if argument_count > i {
			   msg[i] = argument[i];
		   }
		}


#region General variables
		//Current message
		message_current = 0;
		//Last message
		message_end = argument_count-1;
		//How fast the characters appear
		increase = 0.5;
		//How much characters are shown
		characters = 0;
		//What has to be drawn currently
		message_draw = "";
		//Current message length
		message_length = string_length(msg[message_current]);

		
		//General
		name = noone;
		general_colour = c_black;
		text_colour = c_white;
		outline_colour = c_white;
		s_text_colour = c_black; //Colour of the selected option
		alpha = 1; //Transparency
		font = noone;
		separation = 25; //Text separation
		mouse_enabled = false;
		continue_icon = noone; //The sprite of the icon
		continue_icon_frame = 0; //Ignore, used to handle animation speed
		smart_linebreak = false; //!Experimental feature! Prevent text from changing line in middle of a word. Note that this doesn't work correctly in all projects! Read manual for more info.
		last_space = 0; //Related to smart_linebreak, ignore this.
		
		//Especially for speech bubbles
		bubble_width = 300; //Width of the speech bubble
		object_talking = noone; //Needed only for speech bubbles
		
		//Portrait
		sprite = noone; //Portrait or face of the character
		portrait = []; //Array for the portrait/face sprite
		sync_sprite = false; //Sync portrait sprite animation with text or not
		sprite_spd = 0.2; //Image speed of portrait and continue icon
		image_speed = sprite_spd;
		
		//Keys
		speak_key = vk_space;
		skip_key = vk_space;
		
		//Textbox sprite
		textbox_sprite_set = false; //Set this to true if you change the variables below
		textbox_sprite = noone; //Sprite of the textbox (not the character)
		textbox_sprite2 = noone; //Sprite of the name textbox
		
		//Speed of text
		speed_set = false; //Variable to know if speed has been set

		//Text sound
		text_sound = false; //if should make sound
		textsound = noone; //what sound
		text_sound_volume = 1;
		text_sound_interval = 5;

		//Voice acting
		voice = [];
		voice_volume = 1;
		voice_sync_text = false;
		voice_sync_sprite = false;
		voice_played = false;
		
		//Positions
		position_set = false;
		x1 = 0;
		x2 = 0;
		y1 = 0;
		y2 = 0;
		namex1 = 0;
		namex2 = 0;
		namey1 = 0;
		namey2 = 0;
		sprite_position_set = false;
		spritex = 0;
		spritey = 0;
		text_position_set = false;
		textx = 0;
		texty = 0;
		name_text_position_set = false;
		nametextx = 0;
		nametexty = 0;
		option1x = noone;
		option1y = noone;
		option2x = noone;
		option2y = noone;
		option3x = noone;
		option3y = noone;
		
		//Textbox visibility
		textbox_visible = true;

		//Change variable at the end variables
		var_object = noone;
		var_to_change = noone;
		var_value = noone;
	
		//Backlog
		backlog_visible = false;
		texts_in_backlog = 0;
		backlog_position = 0;
		backlog_stop_down = false;
		backlog_stop_up = false;
		scroll_speed = 30;
		for (var i = 0; i < maxmessages; i ++;) {
			if argument_count > i {
				backlog[i] = "";
			}
		}
		backlog[0] = msg[0];

		//Mode
		mode = "box";


#endregion


#region Options
		///Options
		//Variable to know if options has been set
		options_set = false;
		options_set2 = false;
		options_set3 = false;
		//Variable to know if options has to be shown
		options_show = false;
		//options_show2 = false;
		//options_show3 = false;
		//Option variable - Takes track of the selected option
		selected = 1;
		//Variable to check how many options there are
		optioncount = 0;
		optioncount2 = 0;
		optioncount3 = 0;

		//Set additional option variables
		show_options_when = 0;
		option1 = noone;
		option2 = noone;
		option3 = noone;

		message_to_change = 0;
		//message_to_change2 = 0;
		//message_to_change3 = 0;
		ifoption1 = "";
		ifoption2 = "";
		ifoption3 = "";
		/*ifoptionsecond1 = "";
		ifoptionsecond2 = "";
		ifoptionsecond3 = "";
		ifoptionthird1 = "";
		ifoptionthird2 = "";
		ifoptionthird3 = "";*/
		option_outside_view = false;
#endregion



	}


	//Set dialogue
	with(control_cutscene) {
		if current_cutscene == cutscene_id {
			
			//Style
			set_dialogue(name,general_colour,text_colour,outline_colour,alpha,font,sprite,mouse_enabled,continue_icon,separation,smart_linebreak,sync_sprite,sprite_spd);
			
			//Speed
			if speed_set == true {
				if array_length(message_speed) == 1 {
					set_dialogue_speed(message_speed[0]);
				}else if array_length(message_speed) == 2 {
					set_dialogue_speed(message_speed[0],message_speed[1]);
				}else if array_length(message_speed) == 3 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2]);
				}else if array_length(message_speed) == 4 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3]);
				}else if array_length(message_speed) == 5 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3],message_speed[4]);
				}else if array_length(message_speed) == 6 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3],message_speed[4],message_speed[5]);
				}else if array_length(message_speed) == 7 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3],message_speed[4],message_speed[5],message_speed[6]);
				}else if array_length(message_speed) == 8 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3],message_speed[4],message_speed[5],message_speed[6],message_speed[7]);
				}else if array_length(message_speed) == 9 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3],message_speed[4],message_speed[5],message_speed[6],message_speed[7],message_speed[8]);
				}else if array_length(message_speed) == 10 {
					set_dialogue_speed(message_speed[0],message_speed[1],message_speed[2],message_speed[3],message_speed[4],message_speed[5],message_speed[6],message_speed[7],message_speed[8],message_speed[9]);
				}
			}
			
			//Keys
			set_dialogue_keys(speak_key,skip_key);
			
			//Textbox sprite
			if textbox_sprite_set == true {
				set_dialogue_sprite(textbox_sprite,textbox_sprite2);
			}
			
			//Sound
			if text_sound == true {
				if text_sound_interval != 5 {
					set_dialogue_sound(textsound,text_sound_volume,text_sound_interval);
				}else if text_sound_volume != 1 {
					set_dialogue_sound(textsound,text_sound_volume);
				}else{
					set_dialogue_sound(textsound);
				}
			}
			
			//Portrait
			if array_length(portrait) > 0 {
				if array_length(portrait) == 1 {
					set_dialogue_portrait(portrait[0]); //This might be unnecessary, but let's keep it here in case of future changes.
				}else if array_length(portrait) == 2 {
					set_dialogue_portrait(portrait[0],portrait[1]);
				}else if array_length(portrait) == 3 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2]);
				}else if array_length(portrait) == 4 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3]);
				}else if array_length(portrait) == 5 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3],portrait[4]);
				}else if array_length(portrait) == 6 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3],portrait[4],portrait[5]);
				}else if array_length(portrait) == 7 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3],portrait[4],portrait[5],portrait[6]);
				}else if array_length(portrait) == 8 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3],portrait[4],portrait[5],portrait[6],portrait[7]);
				}else if array_length(portrait) == 9 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3],portrait[4],portrait[5],portrait[6],portrait[7],portrait[8]);
				}else if array_length(portrait) == 10 {
					set_dialogue_portrait(portrait[0],portrait[1],portrait[2],portrait[3],portrait[4],portrait[5],portrait[6],portrait[7],portrait[8],portrait[9]);
				}
			}else if sprite != noone {
				set_dialogue_portrait(sprite);
			}
			
			//Position (why was this commented? did I forget something? or have I changed worldlines?!?! Well let's uncomment it and hope that it works. [If someone sees this comment they will probably laugh at me.])
			if position_set == true {
				if name_text_position_set == true {
					set_dialogue_position(x1,y1,x2,y2,namex1,namey1,namex2,namey2,spritex,spritey,textx,texty,nametextx,nametexty);
				}else if text_position_set == true {
					set_dialogue_position(x1,y1,x2,y2,namex1,namey1,namex2,namey2,spritex,spritey,textx,texty);
				}else if sprite_position_set == true {
					set_dialogue_position(x1,y1,x2,y2,namex1,namey1,namex2,namey2,spritex,spritey);
				}else if namex1 != noone {
					set_dialogue_position(x1,y1,x2,y2,namex1,namey1,namex2,namey2);
				}else{
					set_dialogue_position(x1,y1,x2,y2);
				}
			}
			
			//Options
			if options_set == true {
				if optioncount == 1 {
					set_dialogue_options(s_text_colour,show_options_when,option1);
				}
				if optioncount == 2 {
					set_dialogue_options(s_text_colour,show_options_when,option1,option2);
				}
				if optioncount == 3 {
					set_dialogue_options(s_text_colour,show_options_when,option1,option2,option3);
				}
			
				if message_to_change != noone {
					if option3 != "" {
						change_message_according_option(message_to_change,ifoption1,ifoption2,ifoption3);
					}else if option2 != "" {
						change_message_according_option(message_to_change,ifoption1,ifoption2);
					}else{
						change_message_according_option(message_to_change,ifoption1);
					}
				}
			}
		}
	}

	}
}