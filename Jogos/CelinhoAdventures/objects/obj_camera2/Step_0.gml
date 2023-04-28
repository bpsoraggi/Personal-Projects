/// @description Move camera

if (instance_exists(obj_player)) {
	follow = obj_player;	
}

if (follow != noone and instance_exists(obj_player)) {
	xTo = follow.x;
	yTo = follow.y;
}

//x += (xTo - x)/15;
//y += (yTo - y)/15;

if (instance_exists(obj_player)) {
	var _x = clamp(follow.x-camWidth/2, 0, room_width-camWidth);
	var _y = clamp(follow.y-camHeight/2, 0, room_height-camHeight);

	var _cur_x = camera_get_view_x(view_camera[0]);
	var _cur_y = camera_get_view_y(view_camera[0]);

	//camera_set_view_pos(view_camera[0], x-(camWidth*0.5), y-(camHeight*0.5));
	camera_set_view_pos(view, lerp(_cur_x, _x, 0.3), lerp(_cur_y, _y, 0.3));
} else {
	camera_set_view_pos(view_camera[0], 0, 0);
}