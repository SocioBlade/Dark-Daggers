/// @description Insert description here
// Center on the player

var _cam_w = camera_get_view_width(view_camera[0]);
var _cam_h = camera_get_view_height(view_camera[0]);

if instance_exists( obj_Player )
{
	xPoint = (obj_Player.x + mouse_x)/2 - _cam_w/2;
	yPoint = (obj_Player.y + mouse_y)/2 - _cam_h/2;
	x = lerp(x, clamp(xPoint, obj_Player.x - _cam_w/2-50, obj_Player.x - _cam_w/2+50), 0.05);
	y = lerp(y, clamp(yPoint, obj_Player.y - _cam_h/2-50, obj_Player.y - _cam_h/2+50), 0.05);
	//Fuck asså xD
}


//Camera Shake 
	//xShake 
	if xShakeAmount > 0
	{
		xShakeDir += xShakeDirSpd;
		xShakeAmount -= xShakeAmountSpd;
	}
	else
	{
		xShakeAmount = 0;
		xShakeDir = 0;
	}		
	xShake = dsin(xShakeDir) * xShakeAmount;
	
	//yShake 
	if yShakeAmount > 0
	{
		yShakeDir += yShakeDirSpd;
		yShakeAmount -= yShakeAmountSpd;
	}
	else
	{
		yShakeAmount = 0;
		yShakeDir = 0;
	}		
	yShake = dsin(yShakeDir) * yShakeAmount;
	
//add in the shake
x += xShake;
y += yShake;

x = clamp(x, 0, room_width - _cam_w);
y = clamp(y, 0, room_height - _cam_h);

// Camera position
camera_set_view_pos(view_camera[0], x, y);