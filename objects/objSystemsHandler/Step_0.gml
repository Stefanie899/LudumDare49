/// @description Insert description here
// You can write your code in this editor
if (global.paused || room == rmMainMenu || room == rmDefeat || room == rmVictory ) {
	return;	
}

var dt = delta_time / 1000000;
var fireCount = instance_number(objFire);

global.shipSpeed = global.maxShipSpeed;

if (fireCount >= 2) {
	var applicableFires = fireCount;
	
	if (applicableFires >= 10) {
		applicableFires = 10;
	}
	
	global.shipSpeed = global.shipSpeed * (1.0 - (applicableFires / 50));
}

if (global.autoPilotEfficiency <= 80) {
	var speedStep = global.shipSpeed / 80;
	global.shipSpeed -= (80 - global.autoPilotEfficiency) * speedStep;
}

if (global.hullStrength <= 80) {
	var speedStep = global.hullStrength / 80;
	global.shipSpeed -= (80 - global.hullStrength) * speedStep;
}

if (global.hullStrength <= 0 || global.humanHealth <= 0 && room != rmMainMenu && room != rmDefeat && room != rmVictory) {
	objDialogueHandler.startDialogueWithScript(["The hull of the ship got too damaged. UNSTABLE didn't manage to get the humans home safely."], scrDefeat);
	global.gameStarted = false;
}

if (global.isTravelling) {
	global.distanceRemaining -= (global.shipSpeed / 60 / 60) * dt;
	
	if (global.distanceRemaining <= 0 && room != rmMainMenu && room != rmDefeat && room != rmVictory) {
		objDialogueHandler.startDialogueWithScript(["The ship has safely docked at home! Looks like UNSTABLE managed to get the humans home!"], scrVictory);	
		global.gameStarted = false;
	}
}

lifeSupportTimer += dt;
autoPilotTimer += dt;

// Fires should only start to break out when no fires exist.
if (!fireBrokenOut) {
	fireTimer += dt;
}

if (!enemyPresent) {
	enemyTimer += dt;	
}

// Runs every ten seconds.
if (lifeSupportTimer >= 10 && global.lifeSupportFailing) {
	global.lifeSupportEfficiency -= 10;
	
	if (global.lifeSupportEfficiency < 0) {
		global.lifeSupportEfficiency = 0;	
	}
	
	lifeSupportTimer = 0;
}

if (autoPilotTimer >= 20 && global.autoPilotFailing) {
	global.autoPilotEfficiency -= 10;
	
	if (global.autoPilotEfficiency < 0) {
		global.autoPilotEfficiency = 0;	
	}
	
	autoPilotTimer = 0;
}

if (fireTimer >= 30 && global.firesFiring) {
	fireBrokenOut = true;
	
	if (room == rmShip) {
		var placeToSpawn = instance_find(objFireSpawn, irandom(instance_number(objFireSpawn) - 1));
	
		spawnOnObject(objFire, placeToSpawn);
	
		fireTimer = 0;
	}
}

if (enemyTimer >= 30 && global.glorbsAttacking) {
	enemyPresent = true;
	
	if (room == rmShip) {
		var placeToSpawn = instance_find(objGrate, irandom(instance_number(objGrate) - 1));
	
		spawnOnObject(objEnemy, placeToSpawn);
	
		enemyTimer = 0;
	}
}

if (fireBrokenOut && room == rmShip && instance_number(objFire) == 0) {
	fireBrokenOut = false;	
}

if (enemyPresent && room == rmShip && instance_number(objEnemy) == 0) {
	enemyPresent = false;	
}

// Queue up fire spreads even when we're not in room.
if (room != rmShip) {
	fireSpreadTimer += dt;
	
	if (fireSpreadTimer >= timeToSpreadFire) {
		timesFireShouldSpread++;
		fireSpreadTimer = 0;	
		needsToSpreadFires = true;
	}
}

healthTickTimer += dt;

if (healthTickTimer >= timeBetweenHealthTicks) {
	if (global.lifeSupportEfficiency < 70) {
		global.humanHealth -= (70 - global.lifeSupportEfficiency) / 100;
	}
	
	if (fireCount > 5) {
		global.humanHealth -= (fireCount - 5);	
	}
	
	if (global.lifeSupportEfficiency >= 90) {
		global.humanHealth += 1;
	}
	
	if (global.humanHealth < 0) {
		global.humanHealth = 0;
	}
	
	if (global.humanHealth > global.maxHumanHealth) {
		global.humanHealth = global.maxHumanHealth;	
	}
	
	healthTickTimer = 0;
}

if (global.mouseOverInteractable) {
	window_set_cursor(cr_handpoint);	
} else {
	window_set_cursor(cr_arrow);	
}