/// @description Insert description here
// You can write your code in this editor
moveSpeed = 2;
depth = -100;

selectedTool = 1;

timeBetweenShots = 0.5;
shotTimer = 0;
canShoot = true;

function handlePlayerMovement() {
	var key_up = keyboard_check(188);
	var key_down = keyboard_check(ord("O"));
	var key_left = keyboard_check(ord("A"));
	var key_right = keyboard_check(ord("E"));

	var tempX = x;
	var tempY = y;

	if (key_up) {
		tempY -= moveSpeed;	
	}

	if (key_down) {
		tempY += moveSpeed;	
	}

	if (key_left) {
		tempX -= moveSpeed;	
	}

	if (key_right) {
		tempX += moveSpeed;	
	}

	if (tileMeeting(tempX, y, "Collision")) {
		tempX = x;
	}
	
	if (place_meeting(tempX, y, objSolid)) {
		tempX = x;	
	}

	x = tempX;

	if (tileMeeting(x, tempY, "Collision")) {
		tempY = y;
	}
	
	if (place_meeting(x, tempY, objSolid)) {
		tempY = y;	
	}

	y = tempY;
}