/// @description Insert description here
// Inherit the parent event
event_inherited();

spd = .5;
chase_spd = 1;
dir = 0;
xspd = 0;
yspd = 0;

face = 1; 

//State Machine
state = 0;

bullet_inst = noone;

//Timers
cooldown_time = 4*144;
shoot_timer = irandom(cooldown_time);
windup_time = 144;
recover_time = 90; 

//Instanced function
resolve_Damage = function()
{
	//Add score before destroying object
	get_points(1);
	instance_destroy();
}