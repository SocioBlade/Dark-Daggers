/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

dir = 0;
spd = 2;
xspd = 0;
yspd = 0;

//state machine
cur_state = 0; 

// 0 = not moving, aim for player and wait for the enemy to shoot
// 1 = shoot towards the player

//Cleanup
destroy = false;
player_destroy = false;