/// @description Change sprite based on dir

if (direction > 135 and direction <= 225) {
    sprite_index = spr_eye_left;
} else if (sprite_index != spr_eye_right) {
    sprite_index = spr_eye_right;
}