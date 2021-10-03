/// @description Insert description here
// You can write your code in this editor
if (global.paused) {
	return;	
}

x += lengthdir_x(3,direction);
y += lengthdir_y(3,direction);

var dt = delta_time / 1000000;

counter += dt;

if (counter >= timeToLive) {
	instance_destroy();	
}

if (tileMeeting(x, y, "Collision")) {
	instance_destroy();	
}