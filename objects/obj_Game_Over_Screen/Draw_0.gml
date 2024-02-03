/// @description Insert description here
// You can write your code in this editor


var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);
var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);



if global.isDead
{
	//Draw a red rectangle over the screen
	draw_set_alpha(alpha * alphaMax);
	draw_rectangle_color(_camX, _camY, _camX + _camW, _camY+_camH, c_red, c_red, c_red, c_red, false);
	draw_set_alpha(1);

	//Draw text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha);
	draw_set_font(font_Juicy);

		//GAME OVER
	var _gameover_offset = -32;	
	draw_text_transformed(_camX + _camW/2, _camY + _camH/2 + _gameover_offset, "Game Over", 2, 2, 0);


	draw_text_transformed(_camX + _camW/2, _camY + _camH/2 + 40, "Your Score: " + string(obj_HUD.playerScore), 0.8, 0.8, 0);
		//Restart
	var _restart_offset = 90;	
	draw_text_transformed(_camX + _camW/2, _camY + _camH/2 + _restart_offset, "-Press \"Space\" to go to menu-", 0.5, 0.5, 0);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}
