/// @description Insert description here
// You can write your code in this editor

var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);


timer++;

if (timer >= spawner)
{
	instance_create_depth(x, y, depth-1, obj_Skulls);
	
	timer = 0;
	spawner = random_range(50, 200);
}


