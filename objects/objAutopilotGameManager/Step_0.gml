/// @description Insert description here
// You can write your code in this editor
if (global.paused || global.inDialogue) {
	return;	
}

if (keyboard_check_pressed(vk_escape)) {
	room_goto(rmShip);	
}

var dt = delta_time / 1000000;

asteroidCounter += dt;
pathCounter += dt;
pathDecisionCounter += dt;

if (asteroidCounter >= timeBetweenAsteroids) {
	instance_create_layer(random_range(0, room_width - sprite_get_width(sprAsteroid)), random_range(-50, -20), "Instances", objAsteroid);
	asteroidCounter = 0;
}


if (pathCounter >= timeBetweenPaths) {
	instance_create_layer(pathX, -16, "Instances", objPathToFollow);
	pathCounter = 0;
}

if (pathDecisionCounter >= timeBetweenPathDecision) {
	pathDir = irandom_range(0, 2);
	pathDecisionCounter = 0;
	
	timeBetweenPathDecision = random_range(minTimeBetweenPathDecision, maxTimeBetweenPathDecision);
}

if (pathDir == 1) {
	pathX += pathSpeed;
	
	if (pathX > maxPathX) {
		pathDir = 0;	
		pathDecisionCounter = timeBetweenPathDecision;	
	}
}

if (pathDir == 2) {
	pathX -= pathSpeed;
	
	if (pathX < minPathX) {
		pathDir = 0;	
		pathDecisionCounter = timeBetweenPathDecision;	
	}
}