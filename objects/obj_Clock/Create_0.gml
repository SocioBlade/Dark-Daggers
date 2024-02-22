/// @description Insert description here
// You can write your code in this editor

hours = 0;
minutes = 0;
seconds = 0;

var AddSecond = function()
{
	seconds+=0.01;
}

clockTimer = time_source_create(time_source_game, 0.01, time_source_units_seconds, AddSecond, [], -1);