/// @description Change sprite based on dir

if (direction > 135 and direction <= 225) {
    sprite_index = spr_chomper_left;
} else if (sprite_index != spr_chomper_right) {
    sprite_index = spr_chomper_right;
}