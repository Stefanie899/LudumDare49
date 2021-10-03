/// @description Insert description here
// You can write your code in this editor
if (global.paused) {
	return;	
}

if (keyboard_check_pressed(vk_escape)) {
	room_goto(rmShip);	
}

if (global.lifeSupportEfficiency < prevLifeSupport) {
	spawnGunk();
}

prevLifeSupport = global.lifeSupportEfficiency;