/// @description Player movement

// movement
script_execute(state);

// check for collision with NPCs
nearbyNPC = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_npc, false, true);
if (nearbyNPC) {
	// play sound
	if (hasGreeted == false) {
		//audio_play_sound(snd_greeting, 1, 0);
		hasGreeted = true;
	}
	
	//pop-up prompt
	if (npcPrompt == noone || npcPrompt == undefined) {
		npcPrompt = scr_showPrompt(nearbyNPC, nearbyNPC.x, nearbyNPC.y-90);
	}
	
	//show_debug_message("player has found npc")
}

if (!nearbyNPC) {
	// reset greeting
	if (hasGreeted == true) {
		hasGreeted = false;
	}
	
	// get rid of prompt
	scr_dismissPrompt(npcPrompt, 0);
	
	//show_debug_message("player has NOT found npc")
}

// check for nearby doors
nearbyDoor = collision_rectangle(x-doorRange, y-doorRange, x+doorRange, y+doorRange, obj_par_doors, false, true);
if (nearbyDoor) {
	
	// pop-up prompt
	if (doorPrompt == undefined || !instance_exists(doorPrompt)) {
		doorPrompt = scr_showPromptAll(nearbyDoor, nearbyDoor.x-21, nearbyDoor.y-90);
		show_debug_message("Spawned door prompt: " + string(debug_get_callstack()));
	}
}

if (!nearbyDoor) {
	//get rid of prompt
	scr_dismissPrompt(doorPrompt, 1);
}

// play walking sound
if ((vx > 0 || vy > 0) && !audio_is_playing(snd_areia)) {
	var tile = tilemap_get_at_pixel(tilemap, x, y);
	var index = tile_get_index(tile);
	
	if ((index >= 11 && index <= 12) || (index >= 22 && index <= 26) || (index >= 33 && index <= 38) || (index >= 44 && index <= 49)) {
		audio_play_sound(snd_areia, 1, 0);
	}
}

//stamina
if (alarm[1] <= 0) {
	stamina += 1;	
}

stamina = clamp(stamina, 0, maxStamina);

if distance_to_object(obj_par_npc) <= 30 {
	if keyboard_check_pressed(vk_space) and global.dialogue == false {
		var _npc = instance_nearest(x, y, obj_par_npc);
		var _dialogue = instance_create_layer(x, y, "Dialogues", obj_dialogue);
		_dialogue.npcName = _npc.nname;
	}
}


// depth sorting
depth = -y;

if (room == rm_gameMain) {
	walkSpeed = 5;	
}