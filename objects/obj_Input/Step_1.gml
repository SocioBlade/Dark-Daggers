/// @description Insert description here
// You can write your code in this editor

global.up_key = keyboard_check(ord("W"));
global.left_key = keyboard_check(ord("A"));
global.down_key = keyboard_check(ord("S"));
global.right_key = keyboard_check(ord("D"));
global.shoot_key = mouse_check_button(mb_left);
global.inv_swap_down = mouse_wheel_down();
global.inv_swap_up = mouse_wheel_up();
global.action_key = keyboard_check(vk_space);