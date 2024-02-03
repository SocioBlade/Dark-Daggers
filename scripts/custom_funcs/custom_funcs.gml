//draw player weapons

function draw_held_item(recoil_amt = 0)
{
	// Draw Equipment

	//Get the weapon placed "around" player
	var _x_offset = lengthdir_x(item_offset, aim_dir);
	var _y_offset = lengthdir_y(item_offset, aim_dir);
	
	
	var _weapon_y_scale = 1;

	if aim_dir > 90 && aim_dir < 270
	{
		_weapon_y_scale = -1;
	}
	
	//Calculate recoil if any
	if recoil_amt > 0
	{
		_x_offset -= lengthdir_x(recoil_amt, aim_dir);
		_y_offset -= lengthdir_y(recoil_amt, aim_dir)
	}

	draw_sprite_ext(weapon.sprite, 0, x + _x_offset, center_y + _y_offset, 1, _weapon_y_scale, aim_dir, c_white, image_alpha);

}


// Calculate the length of the item based on bbox
function get_item_length(sprite)
{
	return sprite_get_bbox_right(sprite) - sprite_get_xoffset(sprite)
}

function get_points(_pointAmt = 1)
{
	if(instance_exists(obj_HUD))
	{
		obj_HUD.playerScore += _pointAmt;
	}
}

//damage calculation
	//damage create event
function get_damaged_create(_hp = 10, _iframes = false, _max_hp = 10)
{
	hp = _hp;
	maxHP = _max_hp;
	
	//get the iframes
	if _iframes
	{
		iframe_timer = 0;
		iframe_number = 200;
	}
	
	
	if !_iframes
	{
		//create the damage list
		damage_list = ds_list_create();
		
		//This should be checked before. But works for now. 
		indicate_timer = 0;
		indicate_number = 10;
	}
}

	//damage step event
function get_damaged(_damage_obj, _iframes = false, _indicate = false)
{
	var _hit_confirm = false;
	//Special exit for iframe timer
	if _iframes && iframe_timer > 0
	{
		iframe_timer--;
		//Handle iFrame effect
		if iframe_timer mod 12 == 0
		{
			if image_alpha == 1
			{
				image_alpha = 0;
			}
			else
			{
				image_alpha = 1;
			}
		}
		return false;
	}
	
	if _iframes {image_alpha = 1;}
	
	// If this is a damage object that should indicate to the player
	if _indicate && indicate_timer > 0
	{
		particles_on_hit();
		
		indicate_timer--;
		if indicate_timer mod 6 == 0
		{
			if image_blend == c_white
			{
				image_blend = c_red;
			} 
			else
			{
				image_blend = c_white;
			}
		}
		exit;
	}
	
	if _indicate {image_blend = c_white}
	// Recieve Damage
	#region
	if place_meeting(x, y, _damage_obj)
	{
		//getting a list of the damage instances
		var _inst_list = ds_list_create();
		var _temp = instance_place_list(x, y, _damage_obj, _inst_list, false);
		
		
		
		for(var i = 0; i < ds_list_size(_inst_list); i++)
		{
			//Get a damage object instance from the list 
			var _inst = ds_list_find_value(_inst_list, i);
		
			//Check if the instance is in the damage list
			if _iframes || ds_list_find_index(damage_list, _inst) == -1
			{
				//Add the new damage instance to the damage list
				if !_iframes
				{
					ds_list_add(damage_list, _inst);
				}
				
			
				//Take damagae from specific instance
				hp -= _inst.damage;
				_hit_confirm = true;
				//Tell the damage instance that impact has happened
				_inst.hit_confirm = true;
			}

		}
		
		if _iframes && _hit_confirm
		{
			iframe_timer = iframe_number;
		}
		
		if _indicate && _hit_confirm
		{
			indicate_timer = indicate_number;
		}
		//Free mem
		ds_list_destroy(_inst_list);
	}
	#endregion
	
	if !_iframes 
	{	
		//Clear the damage list of objects that don't exist anymore or arent touching anymore
		for (var i = 0; i < ds_list_size(damage_list); i++)
		{
			//If not touching the damage instance anymore, remove it from the list and set the loop back 1 position
			var _inst = ds_list_find_value(damage_list, i);
			if !instance_exists(_inst) || !place_meeting(x,y,_inst)
			{
				ds_list_delete(damage_list, i);
				i--;
			}
		}
	}
	return _hit_confirm;
}

	//damage destroy event
function get_damaged_delete()
{
	//NOT NEEDED IF IFRAME OBJECT
	ds_list_destroy(damage_list);
	
}


function particles_on_hit()
{
	repeat(1)
	{
		with (instance_create_depth(x,y,depth-1,obj_particle))
		{
			sprite_index = spr_blood_particle_1;
			image_angle = random(360);
			fric = 0.8;
			motion_add(other.image_angle+random_range(-180,180),random_range(1,5));
			
		}
	}
}

//Vfx
function screen_shake(_amount = 4)
{
	with(obj_Camera_main)
	{
		xShakeAmount = _amount;
		yShakeAmount = _amount;
	}
}


