///@description Variables

//Enabled
enabled = false;

//Current cutscene
current_cutscene = -1;
//What scene is the current scene in the cutscene
scene = 0;
//If cutscene is going
cutscene_on = false;
//Variable for the player to know when to start the cutscene
cutscene_player = noone;
//Mode (collision,immediate)
cutscene_mode = "collision";


//Variables needed in the cutscenes

timer = 0; //Needed in cutscene_wait()

//Effects
fade_out = false;
fade_in = false;
fade_color = c_black;
rect = false;
rect_ef = false;
line = false;
drawsprite = false;
spr = noone;

//The original camera settings
current_camera = noone;
original_object = noone;



//-------------SETTINGS AREA STARTS-------------///
		
//Here are the default settings of dialogue. You can change them here so that you
//don't need to use cutscene_dialogue_style or other setting scripts every time.
//Even if you change these, you will be able to make
//individual textboxes different using the cutscene_dialogue_style script etc.

//General dialogue variables
name = noone;
general_colour = c_blue;
text_colour = c_white;
outline_colour = noone;
s_text_colour = c_blue; //Colour of the selected option
alpha = 0.8; //Transparency
font = noone;
separation = 25; //Text separation
mouse_enabled = false;
continue_icon = noone; //The sprite of the icon
continue_icon_frame = 0; //Ignore, used to handle animation speed
smart_linebreak = false; //!Experimental feature! Prevent text from changing line in middle of a word. Note that this doesn't work correctly in all projects! Read the manual for more info.

//Portrait - You probably don't want to change it here. Use the script cutscene_dialogue_portrait or cutscene_dialogue_style for this.
sprite = noone; //Portrait or face of the character
portrait = []; //Array for the portrait/face sprite
sync_sprite = false; //Sync portrait sprite animation with text or not
sprite_spd = 0.2; //Image speed of portrait and continue icon

//Especially for speech bubbles - You will need to change these every time with the cutscene_dialogue_style_bubble script anyways.
bubble_width = 300; //Width of the speech bubble
object_talking = noone; //Needed only for speech bubbles

//Keys
speak_key = vk_space;
skip_key = vk_space;

//Textbox sprite
textbox_sprite_set = false; //Set this to true if you change the variables below
textbox_sprite = noone; //Sprite of the textbox (not the character)
textbox_sprite2 = noone; //Sprite of the name textbox

//Sound
text_sound = false;
textsound = noone;
text_sound_volume = 1;
text_sound_interval = 5;

//Position - !This probably doesn't affect anything yet!
position_set = false; //If you change the position settings below, set this to true
//Textbox positions:
x1 = 0;
x2 = 0;
y1 = 0;
y2 = 0;
//Name box positions:
namex1 = 0;
namex2 = 0;
namey1 = 0;
namey2 = 0;
//The position settings below are automatic, so they are not necessary to change always, even if you change other position settings:
//Sprite position:
sprite_position_set = false; //If you change the settings below, set this to true
spritex = 0;
spritey = 0;
//Text position:
text_position_set = false; //If you change the settings below, set this to true
textx = 0;
texty = 0;
//Name text position:
name_text_position_set = false; //If you change the settings below, set this to true
nametextx = 0;
nametexty = 0;
//Option positions - If you change only the first option positions, the others will automatically try to go to correct positions.
option1x = noone;
option1y = noone;
option2x = noone;
option2y = noone;
option3x = noone;
option3y = noone;

//-------------SETTINGS AREA ENDS-------------///




//Text speed
speed_set = false;

//Voice acting
voice = [];
voice_volume = 1;
voice_sync_text = false;
voice_sync_sprite = false;
voice_played = false;

//Options
show_options_when = 0;
option1 = "";
option2 = "";
option3 = "";
optioncount = 0;
options_set = false;
message_to_change = noone;
ifoption1 = "";
ifoption2 = "";
ifoption3 = "";


done = false;