/// @desc
action_key = global.action_key;

if global.isDead
{
	alpha += alphaSpd;
	alpha = clamp(alpha, 0, 1);
	//very volotile should be fixed
	if instance_exists(obj_Lighting_Renderer) { instance_deactivate_object(obj_Lighting_Renderer); }
}

//Scuffed but works as proof of concept
if alpha = 0.8
{
	if instance_exists(obj_server_control)
	{
		obj_server_control.scoreInput = obj_HUD.playerScore;
		obj_server_control.add_score();
	}
}

if action_key && alpha >= 1
{
	game_restart();
}
