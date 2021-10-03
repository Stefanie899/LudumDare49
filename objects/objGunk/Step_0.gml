/// @description Insert description here
// You can write your code in this editor
if (!mouseDown || global.paused) {
	return;	
}

var tempX = x;
var tempY = y;

if (distance_to_point(mouse_x, mouse_y) > 1 && distance_to_point(mouse_x, mouse_y) < 128) {
	dirToMove = point_direction(x, y, mouse_x, mouse_y);
	tempX = x + lengthdir_x(5,dirToMove);
	tempY = y + lengthdir_y(5,dirToMove);
}

if (tileMeeting(tempX, y, "Collision")) {
	tempX = x;
}

x = tempX;

if (tileMeeting(x, tempY, "Collision")) {
	tempY = y;
}

y = tempY;