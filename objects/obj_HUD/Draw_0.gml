/// @description Insert description here
// You can write your code in this editor

var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );
var _cam_w_center = camera_get_view_width(view_camera[0]) / 2;
var _cam_h = camera_get_view_height(view_camera[0]);


var _padding = 32;
var _camWidth = camera_get_view_width(view_camera[0]) / 2;

var _hpString = "Health:\n" + string(playerHP);
var _scoreString = "Score:\n" + string(playerScore);

draw_text_transformed(_camX + _cam_w_center - 72, _camY + _cam_h - 42, _scoreString, 0.3, 0.3, 0);
draw_sprite(spr_doom_face_good, spr_index, _camX + _cam_w_center, _camY + _cam_h - _padding);


