/// @description Variables
randomize();

// movement
state = scr_enemy_choose_state;
nextState = 0;

vx = 0;
vy = 0;
walkSpeed = 0.2;
chaseSpeed = 0.8;

xScale = image_xscale;

destX = 0;
destY = 0;

alarm[0] = 1;

distAggro = 100;
distDisaggro = 200;

// combat
hp = 0;
pushDir = 0;
pushSpeed = 0;
hit = false;

// collisions
c_obj[1] = par_enemies;
c_obj[0] = obj_collision;