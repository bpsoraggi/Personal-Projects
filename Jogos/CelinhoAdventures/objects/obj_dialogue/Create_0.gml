/// @description Variables

enum Infos{
	Text,
	Portrait,
	Side,
	Nname
}

npcName = "";
textGrid = ds_grid_create(4, 0);
page = 0;

op[0] = "";
opAnswer[0] = "";
opNum = 0;
opSelected = 0;
opDraw = false;

initialize = false;

chars = 0;
alarm[0] = 3;