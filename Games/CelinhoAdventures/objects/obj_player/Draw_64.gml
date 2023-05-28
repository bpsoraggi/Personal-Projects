/// @description Draw Healthbar

var _scale = 1;
var _guih = display_get_gui_height() - 900;
var _sprh = sprite_get_height(spr_hud_health) * _scale;
var _hudh = _guih - _sprh;

var _health = obj_player.hp;
var _maxhealth = obj_player.maxHp;
var _stamina = obj_player.stamina;
var _maxstamina = obj_player.maxStamina;

if (room == rm_cave01 || room == rm_cave02 || room == rm_boss) {
	// health bar
	draw_sprite_ext(spr_hud_healthbar, 0, 0, _hudh+120, (_health/_maxhealth)*_scale, _scale, 0, c_white, 1);

	// stamina bar
	draw_sprite_ext(spr_hud_staminabar, 0, 0, _hudh + 152, (_stamina/_maxstamina)*_scale, _scale, 0, c_white, 1);

	// HUD
	draw_sprite_ext(spr_hud_health, 0, 0, _hudh+120, _scale, _scale, 0, c_white, 1);
}