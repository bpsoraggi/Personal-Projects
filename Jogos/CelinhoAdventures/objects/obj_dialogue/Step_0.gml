/// @description Dialogues

if (initialize == false) {
	scr_texts();
	initialize = true;
	alarm[0] = 3;
}


if chars < string_length(textGrid[# Infos.Text, page]) {
	if global.tecla {
		chars = string_length(textGrid[# Infos.Text, page]);
	}
} else {
		
	if (page < ds_grid_height(textGrid) - 1) {
		if global.tecla {
			alarm[0] = 3;
			chars = 0;
			page++;	
		}
	} else {
		if opNum != 0 {
			opDraw = true;
		} else {
			if global.tecla {
				global.dialogue = false;
				instance_destroy();	
			}
		}
	}
}