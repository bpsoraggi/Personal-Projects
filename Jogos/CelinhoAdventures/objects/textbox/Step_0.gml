/// @description Manage everything
if textbox_visible == true && backlog_visible == false {
	
	//If mouse enabled
	if mouse_enabled {
		if options_show == false {
			if mouse_check_button_pressed(mb_left) {
				keyboard_key_press(speak_key);
			}
			if mouse_check_button_released(mb_left) {
				keyboard_key_release(speak_key);
			}
			if mouse_check_button_pressed(mb_right) {
				keyboard_key_press(skip_key);
			}
			if mouse_check_button_released(mb_right) {
				keyboard_key_release(skip_key);
			}
		//Prevent dialogue from advancing if mouse is not pointing any option
		}else if mouse_on_option {
			if mouse_check_button_pressed(mb_left) {
				keyboard_key_press(speak_key);
			}	
			if mouse_check_button_released(mb_left) {
				keyboard_key_release(speak_key);
			}
			if mouse_check_button_pressed(mb_right) {
				keyboard_key_press(skip_key);
			}
			if mouse_check_button_released(mb_right) {
				keyboard_key_release(skip_key);
			}		
		}
		if instance_exists(option_object1) {
			with(option_object1) {
				if distance_to_point(mouse_x,mouse_y)<1 {
					textbox.mouse_on_option = true;
				}else with(option_object2) {
					if distance_to_point(mouse_x,mouse_y)<1 {
						textbox.mouse_on_option = true;
					}else with(option_object3) {
						if distance_to_point(mouse_x,mouse_y)<1 {
							textbox.mouse_on_option = true;
						}else{
							textbox.mouse_on_option = false;
						}
					}
				}
			}
		}
	}

	//Increase characters
	if (characters < message_length) {
		characters += increase;
	
		//Make sound
		if text_sound == true {
			if itstime == true {
				audio_sound_gain(textsound,text_sound_volume,0);
				audio_play_sound(textsound,1,false);
				itstime = false;
				alarm[0] = text_sound_interval;
			}
		}
	
		//Press skip key to skip dialogue
		if itstime2 {
			if keyboard_check_released(skip_key) {
				characters = message_length;
				//Delay to prevent accidental message skips
				itstime2 = false;
				alarm[1] = 5;
			}
		}
		
		//What has to be drawn right now - This has been added to textbox_draw script too. It's here now because speech bubbles won't work otherwise (if not added to textbox_draw_bubble script too)
		message_draw = string_copy(msg[message_current],0,characters);
	
	}else{
		//Press speak key to continue in the dialogue
		if keyboard_check_released(speak_key) {
			if message_current<message_end {
				if delay == false {
					message_current += 1;
					characters = 0;
					message_draw = "";
					message_length = string_length(msg[message_current]);
					voice_played = false;
					//Reset delay variables
					delay = true;
					itstime3 = true;
					//Update backlog
					texts_in_backlog ++;
					for (var i=0;i<texts_in_backlog;i++) {
						backlog[texts_in_backlog-i] = backlog[texts_in_backlog-i-1];
					}
					backlog[0] = msg[message_current];
				}
			}
			//End dialogue if it is the last message
			else {
				if delay == false {
					message_current = 0; //Is resetting these variables here necessary?
					characters = 0;
					message_draw = "";
					message_length = string_length(msg[message_current]);
					if var_to_change != noone {
						variable_instance_set(var_object,var_to_change,var_value);
					}
					instance_destroy();
					
					//If in a cutscene, move to the next scene
					if asset_get_index("control_cutscene")>-1 {
						if cutscene_going() {
							with(control_cutscene) {
								if current_cutscene = cutscene_id {
									cutscene_next();
								}
							}
						}
					}
					
					//Update backlog here too?
				}
			}
		}
	}
	
	var game_spd = game_get_speed(gamespeed_fps); //Var to be used in some stuff below. Hmm... what about delta_time?

	//Do a little delay to prevent accidentally skipping dialogue
	if characters>=message_length && delay == true && itstime3 == true {
		itstime3 = false;
		alarm[3] = game_spd/5;
	}

	//Options
	if options_set == true {
	
		//When to show options
		if message_current == show_options_when {
			options_show = true;
		}else{
			options_show = false;
		}

		//Change a message according to selected option
		if message_to_change != 0 {
			if selected == 1 {
			    msg[message_to_change] = ifoption1;
			}else{
			    if selected == 2 {
			        msg[message_to_change] = ifoption2;
			    }else{
			        if selected == 3 {
			            msg[message_to_change] = ifoption3;
			        }
			    }
			}
		}

	#region Working on this
	/*/If used options second time
	if options_set2 = true {

	//When to show options
	if message_current = show_options_when2 {
		optioncount = optioncount2;
	
		options_show2 = true;
	}else{
		options_show2 = false;
	}
	
	//Change a message according to selected option
	if message_current = show_options_when2 {
		if selected == 1 {
			msg[message_to_change2] = ifoptionsecond1;
		}else{
			if selected == 2 {
				msg[message_to_change2] = ifoptionsecond2;
			}else{
				if selected == 3 {
					msg[message_to_change2] = ifoptionsecond3;
				}
			}
		}
	}
	
	}



	//If used options third time
	if options_set3 = true {
	
	//When to show options
	if message_current = show_options_when3 {
		optioncount = optioncount3;
	
		options_show3 = true;
	}else{
		options_show3 = false;
	}

	//Change a message according to selected option
	if message_current = show_options_when3 {
		if selected == 1 {
			msg[message_to_change3] = ifoptionthird1;
		}else{
			if selected == 2 {
				msg[message_to_change3] = ifoptionthird2;
			}else{
				if selected == 3 {
					msg[message_to_change3] = ifoptionthird3;
				}
			}
		}
	}


	}*/
	#endregion

	}

	//Manage speed of text
	if speed_set == true {
		increase = message_speed[message_current];
	}
	
	//Manage portrait
	if array_length(portrait) > 0 { //This and other similar checks could be optimized checking with a variable if they have been set (more memory usage, but otherwise better performance). Another option could be to do all similar checks the way this is made.
		sprite = portrait[message_current];
	}
	
	//Portrait sprite animation sync with text
	if sync_sprite == true {
		if characters<message_length {
			image_speed = sprite_spd;
		}else{
			image_speed = 0;
			image_index = 0;
		}
	}
	
	//Manage voice acting
	if array_length(voice) > 0 {
		if voice[message_current] != noone {
			if voice_played == false {
				voice_played = true;
				audio_play_sound(voice[message_current],1,false);
				audio_sound_gain(voice[message_current],voice_volume,0);
				//Stop previous sound
				if message_current > 0 {
					if audio_is_playing(voice[message_current-1]) {
						audio_stop_sound(voice[message_current-1]);
					}
				}
			}
			//Sync voice with sprite
			if voice_sync_sprite == true {
				if audio_is_playing(voice[message_current]) { //Or check the pitch of the current position of the sound or something
					image_speed = sprite_spd;
				}else{
					image_speed = 0;
					image_index = 0;
				}
			}
		}
	}
	
	//Manage continue icon animation speed
	if continue_icon != noone {
		if continue_icon_frame >= sprite_get_number(continue_icon) {
			continue_icon_frame = 0;
		}else{
			continue_icon_frame += sprite_spd*game_spd/game_spd;
		}
	}

}

//Backlog
if backlog_visible {
	//Scroll with mouse
	if mouse_wheel_down() && backlog_stop_down == false {
		backlog_position+=scroll_speed; //could change this amount to the current text height or something. or maybe not.
	}else if mouse_wheel_up() && backlog_stop_up == false {
		backlog_position-=scroll_speed;
	}
	//Scroll with keyboard
	if keyboard_check(vk_down) && backlog_stop_down == false {
		backlog_position+=scroll_speed/4;
	}else if keyboard_check(vk_up) && backlog_stop_up == false {
		backlog_position-=scroll_speed/4;
	}
}