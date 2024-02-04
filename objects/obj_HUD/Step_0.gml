/// @description Insert description here
// You can write your code in this editor


if (instance_exists(obj_Player))
{
	playerHP = obj_Player.hp;
	playerMaxHP = obj_Player.maxHP;
	
}
else
{
	playerHP = 0;
}

if		(playerHP > 8) { spr_index = 0; }
else if (playerHP > 6) { spr_index = 1; }
else if (playerHP > 4) { spr_index = 2; }
else if (playerHP > 2) { spr_index = 3; }
else if (playerHP > 0) { spr_index = 4; }
else				   { spr_index = 5; }

if room == rm_level_1
{
	if keyboard_check_pressed(vk_escape)
	{
		
		paused = !paused;
		if !paused
		{
			window_set_cursor(cr_none);
			instance_activate_all();
			surface_free(paused_surf);
			paused_surf = -1;
		}
	}
	
	if paused == true
	{
		window_set_cursor(cr_arrow);
		alarm[0]++;
		//alarm[1]++;
	}
}
