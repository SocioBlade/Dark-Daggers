/// @desc Create and delete highscoredocuments

if keyboard_check_released(ord("N"))
{	
	add_score();
}

if keyboard_check_released(ord("P")) and data != -1 and array_length(data) > 0
{
	delete_score();
}