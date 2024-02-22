/// @description Insert description here
// You can write your code in this editor

time_source_start(clockTimer);


if seconds > 60
{
	seconds -= 60;
	minutes++;
}

if minutes >= 60
{
	minutes -= 60;
	hours++;
}