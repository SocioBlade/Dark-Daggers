/// @description Insert description here
// You can write your code in this editor


switch(room)
{
	case rm_level_1:
		var _camX = camera_get_view_x( view_camera[0] );
		var _camY = camera_get_view_y( view_camera[0] );
		
		var _cam_w = camera_get_view_width(view_camera[0]);
		var _cam_h = camera_get_view_height(view_camera[0]);
		var _cam_w_center = _cam_w / 2;
		var _cam_h_center = _cam_h / 2;
	

		var _padding = 32;
		var _camWidth = camera_get_view_width(view_camera[0]) / 2;

		var _hpString = "Health:\n" + string(playerHP);
		var _scoreString = "Score:\n" + string(playerScore);

		draw_text_transformed(_camX + _cam_w_center - 82, _camY + _cam_h - 42, _scoreString, 0.3, 0.3, 0);
		draw_sprite_ext(spr_doom_face_good, spr_index, _camX + _cam_w_center, _camY + _cam_h - _padding, 1.5, 1.5, 0, c_white, 1);
		draw_sprite_ext(spr_Weapon_Icon, weapon_spr_index, _camX + _cam_w_center + 52, _camY + _cam_h - _padding - 4, 2.5, 2.5, 0, c_white, 1);
		
		if paused
		{
			if !surface_exists(paused_surf)
			{
				if paused_surf == -1
				{
					instance_deactivate_all(true);
				}
				paused_surf = surface_create(display_get_width(), display_get_height());
				surface_set_target(paused_surf);
				draw_surface(application_surface, 0, 0);
				//surface_resize(application_surface, display_get_width(), display_get_height())
				surface_reset_target();
			}
			else
			{
				draw_surface(paused_surf, 0, 0);
				draw_set_alpha(0.5);
				draw_rectangle_colour(0, 0, display_get_width(), display_get_height(), c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_set_halign(fa_center);
				draw_text_transformed_colour(_camX + _cam_w_center, _camY + _cam_h_center - 64, "- PAUSED -", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);
				draw_set_halign(fa_left);
			}
		}
		
		break;
}
