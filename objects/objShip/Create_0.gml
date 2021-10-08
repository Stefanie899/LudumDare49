/// @description Insert description here
// You can write your code in this editor

moveSpeed = 2;

function handlePlayerMovement() {
	var key_up = keyboard_check(188) || keyboard_check(ord("W"));
	var key_down = keyboard_check(ord("O")) || keyboard_check(ord("S"));
	var key_left = keyboard_check(ord("A"));
	var key_right = keyboard_check(ord("E")) || keyboard_check(ord("D"));

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
	
	if (tempX < 0) {
		tempX = x;	
	}
	
	if (tempX > room_width - sprite_get_width(sprShip)) {
		tempX = x	
	}
	
	if (tempY < 0) {
		tempY = y;	
	}
	
	if (tempY > room_height - sprite_get_height(sprShip)) {
		tempY = y;	
	}

	x = tempX;
	y = tempY;
}