/// @description Insert description here
// You can write your code in this editor
if (!isActive) {
	return;	
}

with (other) {
	instance_destroy();	
}

curHealth--;

if (curHealth <= 0) {
	isActive = false;
	curHealth = maxHealth;
	
	global.hullStrength += 5;

	if (global.hullStrength > 100) {
		global.hullStrength = 100;	
	}
}