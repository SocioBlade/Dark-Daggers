/// @description Initialize player variables

up_key = 0;
down_key = 0;
right_key = 0;
left_key = 0;
shoot_key = 0;
inv_swap_down = 0;
inv_swap_up = 0;

move_dir = 0; 
move_spd = 2;

x_spd = 0;
y_spd = 0;



// Sprite control
#region
center_y_offset = -8;
center_y = y + center_y_offset;
item_offset = 6;
aim_dir = 0;

	//Add the sprites to an array
face = 3;
sprite = [spr_Player_Right, spr_Player_Up, spr_Player_Left, spr_Player_Down];


#endregion

// Held item info

shoot_timer = 0;
recoil_amt = 0;

// Add weapon to array
array_push (global.weapon_inventory, 
global.weapon_list.shotgun,  
global.weapon_list.assault)

current_weapon = 0;
weapon = global.weapon_inventory[current_weapon];

get_damaged_create(10, true);
