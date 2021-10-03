/// @description Insert description here
// You can write your code in this editor
if (path_position != 1) {
	return;	
}

if (global.paused) {
	path_speed = 0;
	return;
}

path_speed = 0.2;



var dt = delta_time / 1000000;

counter += dt;

if (counter >= timeBetweenAttacks) {
	global.humanHealth -= 5;;
	counter = 0;
}