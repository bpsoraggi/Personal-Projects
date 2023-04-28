/// @description draw textbox

var _guiw = display_get_gui_width();
var _guih = display_get_gui_height();

var _xx = _guiw/2;
var _yy = _guih - 200;

var _stringw = string_width(textToShow);

image_xscale = _stringw/dw;
image_yscale = yscale;

draw_self();

draw_set_font(font_textbox);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext(x, y, textToShow, lineHeight, textWidth);