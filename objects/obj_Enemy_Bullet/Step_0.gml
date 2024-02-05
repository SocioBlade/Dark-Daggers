 /// @description Insert description here
// You can write your code in this editor

switch ( cur_state )
{
	case 0:
		if instance_exists(obj_Player)
		{
			dir = point_direction(x, y, obj_Player.x, obj_Player.y);
			
		}
		
		//set depth to make more visable. 
		depth = -y - 50;
	break; 
	
	case 1:
		visible = true;
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		image_angle = dir;
		x += xspd;
		y += yspd;
		
		//update depth
		depth = -y;
	break;
}


//cleanup
if bbox_right < 0 || bbox_left > room_width || bbox_bottom < 0 || bbox_top > room_height
{
	destroy = true;
}

if hit_confirm == true && player_destroy == true {destroy = true;}

// Destroy code
if destroy { instance_destroy();}

// Collision
if place_meeting(x, y, obj_Wall) {destroy = true;}

// Check range
//if point_distance(xstart, ystart, x, y) > max_dist {destroy = true;}
















