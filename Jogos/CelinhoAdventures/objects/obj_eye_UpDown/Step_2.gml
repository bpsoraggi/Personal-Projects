/// @description Change sprite based on dir
if (direction > 45 and direction <= 135 and sprite_index != spr_chomper_up) {
    sprite_index = spr_eye_up;
} else if (direction > 225 and direction <= 315 and sprite_index != spr_chomper_down) {
    sprite_index = spr_eye_down;
}