/// @description draw dialogue
if initialize == true {
	var _guiw = display_get_gui_width();
	var _guih = display_get_gui_height();

	var _xx = _guiw/2;
	var _yy = _guih - 200;
	var _sprite = textGrid[# Infos.Portrait, page];
	
	var _text = string_copy(textGrid[# Infos.Text, page], 0, chars);

	draw_set_font(font_textbox);
	draw_set_color(#503F36);

	if textGrid[# Infos.Side, page] == 0 {
		//left side
		draw_sprite_ext(spr_textbox, 0, _xx, _yy, 1, 1, 0, c_white, 1);
		
		draw_text(_xx - 300, _yy - 120, textGrid[# Infos.Nname, page]);
		
		draw_text_ext(_xx - 300, _yy - 45, _text, 38, 840);
	
		draw_sprite_ext(_sprite, 0, 425, _guih - 75, 1, 1, 0, c_white, 1);
	} else {
	
		//right side
		draw_sprite_ext(spr_textbox2, 0, _xx - 7, _yy, 1, 1, 0, c_white, 1);
		
		draw_text(_xx + 220, _yy - 120, textGrid[# Infos.Nname, page]);
		
		draw_text_ext(_xx - 500, _yy - 45, _text, 38, 840);
	
		draw_sprite_ext(_sprite, 0, _guiw - 425, _guih - 75, -1, 1, 0, c_white, 1);
	}

	scr_dismissPrompt(obj_prompt, 0);
	
	if opDraw == true {
		var _opx = _xx - 400;
		var _opy = _yy - 200;
		var _opsep = 80;
		var _opborder = 12;
		
		opSelected += keyboard_check_pressed(ord("W")) - keyboard_check_pressed(ord("S"));
		opSelected = clamp(opSelected, 0, opNum - 1);
		
		for (var i = 0; i < opNum; i++) {
			var _stringw = string_width(op[i]);
			draw_sprite_ext(spr_op, 0, _opx + 50, _opy - (_opsep*i), (_stringw + _opborder * 2)/49, 1, 0, c_white, 1);
			draw_text(_opx + _opborder + 50, _opy - (_opsep * i)-25, op[i]);
			
			if opSelected == i {
				draw_sprite(spr_selector, 0, _opx, _opy - (_opsep*i))	
			}
		}
		
		if global.tecla {
			var _dialogue = instance_create_layer(x, y, "Dialogues", obj_dialogue);
			_dialogue.npcName = opAnswer[opSelected];
			
			instance_destroy();
		}
	}
}