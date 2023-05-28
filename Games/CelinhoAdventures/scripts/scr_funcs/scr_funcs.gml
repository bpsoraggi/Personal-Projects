// Script assets have changed for v2.3.0 see

function end_of_animation() {
	/// @description animation_end(sprite_index,image_index, rate)
    /// @param {real} <sprite_index> The index of the sprite being animated
    /// @param {real} <image_index> The current frame value
    /// @param {real} <rate> -See Below-
    ///     The rate of change in frames per step if not
    ///     using built in image_index/image_speed.  
    ///     Don't use if you don't think you need this.  You probably don't.
 
    //returns true if the animation will loop this step.
 
    //Script courtesy of PixellatedPope & Minty Python from the GameMaker subreddit discord 
    //https://www.reddit.com/r/gamemaker/wiki/discord
 
    var _sprite = sprite_index;
    var _image = image_index;
    if(argument_count > 0)   _sprite = argument[0];
    if(argument_count > 1)  _image = argument[1];
    var _type = sprite_get_speed_type(sprite_index);
    var _spd = sprite_get_speed(sprite_index)*image_speed;
    if(_type == spritespeed_framespersecond)
        _spd = _spd/room_speed;
    if(argument_count > 2) _spd = argument[2];
    return _image + _spd >= sprite_get_number(_sprite);
}

function draw_text_color_outline(){
    //Created by Andrew McCluskey http://nalgames.com/
 
    ///@arg x
    ///@arg y
    ///@arg str
    ///@arg outwidth
    ///@arg outcol
    ///@arg outfidelity
    ///@arg separation
    ///@arg width
 
 
    //2,c_dkgray,4,20,500 <Personal favorite preset. (For fnt_3)
    var dto_dcol = draw_get_color();
 
    draw_set_color(argument4);
 
    for(var dto_i=45; dto_i<405; dto_i+=360/argument5) {
      //draw_text_ext(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),argument2,argument6,argument7);
      draw_text_ext(argument0+round(lengthdir_x(argument3,dto_i)),argument1+round(lengthdir_y(argument3,dto_i)),argument2,argument6,argument7);
    }
 
    draw_set_color(dto_dcol);
 
    draw_text_ext(argument0,argument1,argument2,argument6,argument7);
}

function fade_to_room() {
	/// @arg room
	/// @arg duration
	/// @arg color
	
	var _room = argument[0];
	var _dur = argument[1];
	var _color = argument[2];
	
	var _inst = instance_create_depth(0, 0, 0, obj_fade);
	
	with (_inst) {
		targetRoom = _room;
		duration = _dur;
		color = _color;
	}
}

function fade_to_room2() {
	/// @arg room
	/// @arg duration
	/// @arg color
	/// @arg x
	/// @arg y
	/// @arg fade
	
	var _room = argument[0];
	var _dur = argument[1];
	var _color = argument[2];
	var _xx = argument[3];
	var _yy = argument[4];
	var _fade = argument[5];
	
	var _inst = instance_create_depth(0, 0, 0, _fade);
	
	with (_inst) {
		targetRoom = _room;
		duration = _dur;
		color = _color;
		xx = _xx;
		yy = _yy;
	}
}

function fade_to_room3() {
	/// @arg room
	/// @arg duration
	/// @arg color

	
	var _room = argument[0];
	var _dur = argument[1];
	var _color = argument[2];

	
	var _inst = instance_create_depth(0, 0, 0, obj_fadeRoom);
	
	with (_inst) {
		targetRoom = _room;
		duration = _dur;
		color = _color;
	}
}


function wait(wait_seconds) {
	///@description wait
	///@arg seconds
	//Wait for a certain amount of seconds

	//Add 1 step
	var _timer = 0;
	_timer++;
	//If waited for enough time
	if _timer >= wait_seconds*room_speed {
		//Reset the timer
		_timer = 0;
	}

}