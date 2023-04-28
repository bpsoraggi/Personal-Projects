/// @description Talking animation

if initialize == true {
	if chars < string_length(textGrid[# Infos.Text, page]) {
		var _snd = snd_typing
		//var _snd = choose(snd1, snd2, snd3, ...);
	
		audio_play_sound(_snd, 1, 0);
		chars++;
		alarm[0] = 3;
	}
}