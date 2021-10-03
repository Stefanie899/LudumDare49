/// @description Insert description here
// You can write your code in this editor
timeBetweenAsteroids = 0.5;
timeBetweenPaths = 0.25;

maxTimeBetweenPathDecision = 1;
minTimeBetweenPathDecision = 0.5;

timeBetweenPathDecision = random_range(minTimeBetweenPathDecision, maxTimeBetweenPathDecision);

asteroidCounter = 0;
pathCounter = 0;
pathDecisionCounter = 0;

pathDir = 0;
pathSpeed = 3;

minPathX = 16;
maxPathX = room_width - sprite_get_width(sprAsteroid) - 16;

pathX = random_range(minPathX, maxPathX);