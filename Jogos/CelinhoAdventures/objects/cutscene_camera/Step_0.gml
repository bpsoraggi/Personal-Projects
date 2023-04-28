//Follow an object

if shake = false {
	var shake_amount = 0;
}else{
	var shake_amount = random_range(min_amount,max_amount);
}

if following != noone {
	x = following.x+shake_amount;
	y = following.y+shake_amount;
}else{
	x += shake_amount;
	y += shake_amount;
}