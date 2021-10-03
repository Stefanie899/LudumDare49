/// @description Insert description here
// You can write your code in this editor
direction = point_direction(x, y, mouse_x, mouse_y);

direction += random_range(-25, 25);

rotation = random_range(0, 360);
scale = random_range(0.8, 1.2);

timeToLive = random_range(0.15, 0.30);
counter = 0;