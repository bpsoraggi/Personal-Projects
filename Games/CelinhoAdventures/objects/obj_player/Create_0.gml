/// @description Variables

verde = -1;

// movement
walkSpeed = 5;
vx = 0;
vy = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;

mask = 0;
timer = 120;

// dash
dashDir = -1;
dashSpeed = 15;
maxStamina = 100;
stamina = maxStamina;

// check for objects
nearbyNPC = noone;
lookRange = 50;
nearbyDoor = noone;
doorRange = 100;

hasGreeted = false;

npcPrompt = noone;
doorPrompt = noone;

// tiles
tilemap = layer_tilemap_get_id("TilesMain");

// health system
maxHp = 50;
hp = maxHp;

takeDamage = true;
pushDir = 0;
pushSpeed = 0;

// health bar
healthbar_width = 300;
healthbar_height = 30;

enemies_hit = ds_list_create();

// states
state = scr_player_walking;

// combat
damage = 5;
attack = false;

damage_alpha = -1;