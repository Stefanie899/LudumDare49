/// @description Insert description here
// You can write your code in this editor
depth = -9000;

target = instance_find(objHumanIncubator, irandom(instance_number(objHumanIncubator) - 1));

path = path_add();

if (mp_grid_path(global.grid, path, x, y, target.x, target.y, true)) {
	path_start(path, 0.2, path_action_stop, true);
}

maxHealth = 4;
curHealth = maxHealth;

timeBetweenAttacks = 0.5;

counter = 0;