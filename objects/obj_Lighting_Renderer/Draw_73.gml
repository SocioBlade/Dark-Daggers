/// @description Insert description here
// You can write your code in this editor

//depth -= y;

if (surface_exists(lighting_surface) == false) 
{
	//Place for optimization
	lighting_surface = surface_create(room_width, room_height);
}

surface_set_target(lighting_surface);

draw_clear_alpha(c_black, 0.9);



with (obj_Lighting_Cutout) 
{
	var wobble_xamt = image_xscale + random_range(-wobble, wobble);	
	var wobble_yamt = image_yscale + random_range(-wobble, wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x, y, wobble_xamt, wobble_yamt, 0, c_white, 1);
	
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, wobble_xamt, wobble_yamt, 0, color, intensity);
	
	with (obj_Enemy_Bullet) 
	{
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(spr_lightMask_s, 0, x, y, image_xscale*2, image_yscale*2, 0, c_orange, 1);
	
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_lightMask_s, 0, x, y, image_xscale*2, image_yscale*2, 0, c_orange, 2);
	
		
	}
	
	with (obj_Bullet) 
	{
		gpu_set_blendmode(bm_subtract);
		draw_sprite_ext(spr_lightMask_s, 0, x, y, image_xscale/2, image_yscale/2, image_angle, c_yellow, 1);
	
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(spr_lightMask_s, 0, x, y, image_xscale/2, image_yscale/2, image_angle, c_yellow, 1);
		
	}
	
	gpu_set_blendmode(bm_normal);
}





surface_reset_target();

draw_surface(lighting_surface, 0,0);