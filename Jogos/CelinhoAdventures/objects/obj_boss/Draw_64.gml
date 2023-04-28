/// @description draw healthbar

var _scale = 1;
var _gw = display_get_gui_width();

if instance_exists(obj_boss) {
	var _sprw = sprite_get_width(spr_boss_hud) * _scale;
	
	draw_sprite_ext(spr_boss_hud, 0, _gw/2 - _sprw/2, 50, _scale, _scale, 0, c_white, 1);
	draw_sprite_ext(spr_boss_health, 0, _gw/2 - _sprw/2 + 6, 50, obj_boss.hp/obj_boss.maxHp * _scale, _scale, 0, c_white, 1);
}