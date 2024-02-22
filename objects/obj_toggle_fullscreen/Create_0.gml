/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

button_text = "Fullscreen";
activate_button = function()
{
	if window_get_fullscreen()
	{
		window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);
	}
}

