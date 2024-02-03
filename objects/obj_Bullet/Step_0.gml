/// @description Insert description here
// You can write your code in this editor


x_spd = lengthdir_x(spd, dir);
y_spd = lengthdir_y(spd, dir);


x += x_spd;
y += y_spd;


//cleanup
if hit_confirm == true && enemy_impact == true {destroy = true;};

// Destroy code
if destroy
{
	instance_destroy();
}

// Collision
if place_meeting(x, y, obj_Wall) {destroy = true; particles_on_hit()}

// Check range
if point_distance(xstart, ystart, x, y) > max_dist {destroy = true;}
