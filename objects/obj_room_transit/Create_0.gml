/// @description Insert description here
// You can write your code in this editor


doorOpen = false;

var DoorState = function()
{
	doorOpen = true; 
	image_index = 1;
}

door_timer = time_source_create(time_source_game, spawn_timer, time_source_units_seconds, DoorState, [], -1);



