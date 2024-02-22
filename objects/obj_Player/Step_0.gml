/// @description Handle Movement

//Get input
up_key = global.up_key;
left_key = global.left_key;
down_key = global.down_key;
right_key = global.right_key;
shoot_key = global.shoot_key;
inv_swap_down = global.inv_swap_down;
inv_swap_up = global.inv_swap_up;


//Player movement
#region
	//Get direction
var _horiz_key = right_key - left_key; 
var _verti_key = down_key - up_key;
move_dir = point_direction(0, 0, _horiz_key, _verti_key);

	//Get x and y speeds
var _spd = 0;
var _input_amt = point_distance(0, 0, _horiz_key, _verti_key);
_input_amt = clamp(_input_amt, 0, 1);
_spd = move_spd * _input_amt;

x_spd = lengthdir_x(_spd, move_dir);
y_spd = lengthdir_y(_spd, move_dir);

	//Check collision
check_collision(self, obj_Pit_wall);
interactable = check_interactable(self, obj_room_transit);

	//Move the player
x += x_spd;
y += y_spd;

	//Depth control
depth = -bbox_bottom;

#endregion

//Player Aiming
#region
center_y = y + center_y_offset;

	// Aim
aim_dir = point_direction(x, center_y, mouse_x, mouse_y);

#endregion

//Sprite control
#region
face = round(aim_dir / 90);
if face == 4 { face = 0; };
	// Set the player sprite
mask_index = sprite[3];
sprite_index = sprite[face];
#endregion


//Take damage and die
if get_damaged(obj_DmgPlayer, true)
{
	//Shake the screen 
	screen_shake(5);
}


	//Death 
if hp <= 0
{
	instance_destroy();
	global.isDead = true; //Not sure if this is the best...
	exit;
}

//Item Swapping
var _player_items = global.weapon_inventory;

//Cycle through weapons
if inv_swap_down
{
	//Change selection 
	current_weapon++;
	if current_weapon >= array_length(_player_items) { current_weapon = 0; }
	weapon = _player_items[current_weapon];
	if instance_exists(obj_HUD)
	{
		if obj_HUD.weapon_spr_index == 0 { obj_HUD.weapon_spr_index = 1;}
		else { obj_HUD.weapon_spr_index = 0;}
	}
}

if inv_swap_up
{
	current_weapon--;
	if current_weapon < 0 { current_weapon = array_length(_player_items)-1 }
	weapon = _player_items[current_weapon];
	if instance_exists(obj_HUD)
	{
		if obj_HUD.weapon_spr_index == 0 { obj_HUD.weapon_spr_index = 1;}
		else { obj_HUD.weapon_spr_index = 0;}
	}
}

//Shooting
if shoot_timer > 0 {shoot_timer--;}
if shoot_key && shoot_timer <= 0
{
	shoot_timer = weapon.cooldown;
	recoil_amt = weapon.recoil;
	shoot(self, weapon, item_offset, aim_dir);
	screen_shake(weapon.shakeAmt);
}
recoil_amt = lerp(recoil_amt, 0,0.1)
