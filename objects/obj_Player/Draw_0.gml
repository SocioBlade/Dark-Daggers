/// @description Insert description here
// You can write your code in this editor


if aim_dir >= 0 && aim_dir < 180
{
	draw_held_item(recoil_amt);
}

draw_self();

if aim_dir >= 180 && aim_dir < 360
{
	draw_held_item(recoil_amt);
}

//Draw text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(font_Juicy);
//draw_text_transformed(x, y, string(hp), 0.2, 0.2, 0);
//draw_text (x, y, string(hp));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);
