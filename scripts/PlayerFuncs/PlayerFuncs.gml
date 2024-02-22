/*
These are the buildning blocks of the obj player. 
All larger functions are place here to increase readability and also abstract usecases for future plans. 
*/

function check_collision(object, collider)
{
	if (!instance_exists(object)) { exit; }
	if place_meeting(object.x + object.x_spd, object.y, collider) { object.x_spd = 0;}
	if place_meeting(object.x, object.y + object.y_spd, collider) { object.y_spd = 0;}
}

function check_interactable(object, collider)
{
	if (!instance_exists(object)) { exit; }
	if (place_meeting(x, y, collider)) 
	{
		if collider.doorOpen && keyboard_check_released(ord("E"))
		{
			room_goto(asset_get_index(collider.room_index));
		}
		return true;
	}
	
	return false;
}

function shoot(object, weapon, offset, aim_dir)
{
	var _xoffset = lengthdir_x(weapon.length + offset, aim_dir);
	var _yoffset = lengthdir_y(weapon.length + offset, aim_dir);
	var _spread = weapon.spread;
	var _spread_div = _spread / max(weapon.nr_of_bullets-1, 1);
	
	for (var i = 0; i < weapon.nr_of_bullets; i++)
	{
		var _bullet_instance = instance_create_depth(object.x + _xoffset, object.center_y + _yoffset, depth-100, weapon.bullet);
		
		//Set bullet direction
		_bullet_instance.dir = other.aim_dir - _spread/2 + _spread_div*i;
		_bullet_instance.image_angle = _bullet_instance.dir;
		_bullet_instance.image_xscale = max(1, _bullet_instance.spd/_bullet_instance.sprite_width)
	}
}