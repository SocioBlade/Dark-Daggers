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