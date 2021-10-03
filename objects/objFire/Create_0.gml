/// @description Insert description here
// You can write your code in this editor
maxLife = 10;
life = maxLife;

scale = random_range(0.8, 1.2);

timeToSpread = 15;
numTimesSpread = 0;
numToSpread = irandom_range(1, 3);

if (instance_number(objFire) > 50) {
	numToSpread = 1;
	timeToSpread = 30;
}

counter = 0;

function spreadFire() {
	if (numTimesSpread >= numToSpread) {
		return;
	}

	var dirToMove = random_range(0, 360);
	
	var tempX = x + lengthdir_x(16,dirToMove);
	var tempY = y + lengthdir_y(16,dirToMove);
	
	if (tileMeeting(tempX, y, "Collision")) {
		tempX = x;
	}

	if (tileMeeting(x, tempY, "Collision")) {
		tempY = y;
	}
	
	while (x == tempX && y == tempY) {
		dirToMove = random_range(0, 360);
	
		tempX = x + lengthdir_x(16,dirToMove);
		tempY = y + lengthdir_y(16,dirToMove);
	
		if (tileMeeting(tempX, y, "Collision")) {
			tempX = x;
		}

		if (tileMeeting(x, tempY, "Collision")) {
			tempY = y;
		}	
	}
	
	instance_create_layer(tempX, tempY, "Instances", objFire);
	
	numTimesSpread++;
}