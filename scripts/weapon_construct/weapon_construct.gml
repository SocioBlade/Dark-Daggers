// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WeaponConstruct(_sprite = spr_Shotgun, _length = 0, _bullet_obj = obj_Bullet, _cooldown = 10, _nr_of_bullets = 1, _spread = 0, _recoil = 6, _shakeAmt = 1 ) constructor 
{
	sprite = _sprite;
	length = _length;
	bullet = _bullet_obj;
	cooldown = _cooldown;
	nr_of_bullets = _nr_of_bullets;
	spread = _spread;
	recoil = _recoil;
	shakeAmt = _shakeAmt;
}


//Inventory
global.weapon_inventory = array_create(0);


//Weapons 
global.weapon_list = 
{
	shotgun : new WeaponConstruct(spr_Shotgun, get_item_length(spr_Shotgun), obj_Buckshot, 80, 8, 45, 8, 2), 
	rocketL : new WeaponConstruct(spr_RocketLauncher, get_item_length(spr_RocketLauncher), obj_Rocket, 100, 1, 0),
	assault	: new WeaponConstruct(spr_Assult, get_item_length(spr_Assult), obj_Bullet, 15, 1, 0) 
}