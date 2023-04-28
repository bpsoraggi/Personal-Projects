/// @description Set the views & cameras
//Enable the use of views
view_enabled = true;

//Make view 0 visible
view_set_visible(0, true);

//Set the port bounds of view 0 to 1024×576
view_set_wport(0,720);
view_set_hport(0,405);

//Resize and center
window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0]);
surface_resize(application_surface,view_wport[0],view_hport[0]);



//Camera creation

//Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(0,0,720,405,0,example_player,-1,-1,500,500);

//Set view0 to use the camera "camera"
view_set_camera(0,camera);