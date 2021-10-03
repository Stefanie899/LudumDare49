/// @description Insert description here
// You can write your code in this editor
if (global.paused) {
	return;	
}

var dt = delta_time / 1000000;

handlePlayerMovement();

depth = -y;

if (keyboard_check_pressed(vk_escape)) {
	global.paused = true;
	room_goto(rmMainMenu);	
}

if (keyboard_check_pressed(ord("1"))) {
	selectedTool = 1;	
}

if (keyboard_check_pressed(ord("2"))) {
	selectedTool = 2;	
}

if (keyboard_check_pressed(ord("3"))) {
	selectedTool = 3;	
}

if (!canShoot) {
	shotTimer += dt;
	
	if (shotTimer >= timeBetweenShots) {
		canShoot = true;
		shotTimer = 0;
	}
}

if (mouse_check_button(mb_left) && global.showTools && !global.mouseOverInteractable) {
	switch (selectedTool) {
		case 1:
			if (global.extinguisherLeft <= 0) {
				break;	
			}
			
			global.extinguisherLeft -= 0.5;
			
			if (global.extinguisherLeft < 0) {
				global.extinguisherLeft = 0;	
			}
			
			instance_create_layer(x, y, "Instances", objExtinguisherCloud);
			break;
		case 2:
			if (global.welderLeft <= 0) {
				break;	
			}
			
			global.welderLeft -= 0.5;
			
			if (global.welderLeft < 0) {
				global.welderLeft = 0;	
			}
			
			instance_create_layer(x, y, "Instances", objWeldingSpark);
			break;
		case 3:
			if (!canShoot || global.ammoLeft <= 0) {
				break;	
			}
			
			global.ammoLeft--;
			
			if (global.ammoLeft < 0) {
				global.ammoLeft = 0;
			}
			
			canShoot = false;
			instance_create_layer(x, y, "Instances", objBullet);
			break;
	}
}