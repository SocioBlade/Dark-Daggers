/// @description Insert description here
// You can write your code in this editor


if aim_dir >= 0 && aim_dir < 180
{
	draw_held_item(recoil_amt);
}
draw_sprite(shadow_spr, 0, x, y);

draw_self();

if aim_dir >= 180 && aim_dir < 360
{
	draw_held_item(recoil_amt);
}

if interactable
{
	//Draw text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(font_Juicy);
	draw_text_transformed(x, y-32, "E", 0.4, 0.4, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}

//Draw text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(font_Juicy);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);