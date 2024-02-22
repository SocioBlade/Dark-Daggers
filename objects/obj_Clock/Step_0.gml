/// @description Insert description here
// You can write your code in this editor

if room == rm_level_1
{
	time_source_start(clockTimer);
} 
else
{
	time_source_pause(clockTimer); 
}



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