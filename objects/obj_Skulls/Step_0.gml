/// @description Insert description here
// You can write your code in this editor

//State machine
switch (state)
{
	case 0:
		// Chase the player
		if instance_exists(obj_Player)
		{
			dir = point_direction(x,y, obj_Player.x, obj_Player.y);
		}
		image_index = 0;
		//set correct speed
		spd = chase_spd;
		
		//Transition to shooting sate
		shoot_timer++;
		
		if shoot_timer > cooldown_time
		{
			state = 1;
			shoot_timer = 0;
		}
		
	break;
	
	case 1:
	
		//Shoot at player
		if instance_exists(obj_Player)
		{
			dir = point_direction(x,y, obj_Player.x, obj_Player.y);
		}
		image_index = 1;
		// set correct speed
		spd = 0;
		
		//stop animating / manually set image index
		
		//Shoot bullet
		shoot_timer++;
		
		//Create bullet
		if shoot_timer == 1
		{
			bullet_inst = instance_create_depth(x, y, depth, obj_Enemy_Bullet);
		}
		
		//Shoot after windup
		if shoot_timer = windup_time && instance_exists(bullet_inst)
		{
			bullet_inst.cur_state = 1;
		}
		
		//Recover and return to chase the player
		if shoot_timer > windup_time + recover_time
		{
			state = 0;
			shoot_timer = 0;
		}
		
	
	break;
}




xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

//Getting the correct face. 
if dir > 90 && dir < 270
{
	face = 1;
} else {
	face = -1;
}

// Collisions
if place_meeting(x + xspd, y, obj_Wall) || place_meeting(x + xspd, y, obj_EnemyMaster) 
{ xspd = 0;}
if place_meeting(x, y + yspd, obj_Wall) || place_meeting(x, y + yspd, obj_EnemyMaster) 
{ yspd = 0;}
// Move
x += xspd;
y += yspd;

// Set depth
depth = -y;

// Flip sprite based on face.
image_xscale = face;

// Inherit the parent event
event_inherited();