/// @description Insert description here
// You can write your code in this editor
if (room != rmShip) {
	return;
}

if (global.resetGame) {
	reset();	
}

if (needsCreateTutorial) {
	instance_create_layer(0, 0, "Instances", objTutorialHandler);
	needsCreateTutorial = false;
}

if (needsToSpreadFires) {
	needsToSpreadFires = false;
	
	var fireNum = instance_number(objFire);
	
	for (var i = 0; i < fireNum; i++) {
		var fire = instance_find(objFire, i);
		
		for (var j = 0; j < timesFireShouldSpread; j++) {
			fire.spreadFire();
		}
	}
	
	timesFireShouldSpread = 0;
}

var numCrackedHulls = 0;

for (var i = 0; i < instance_number(objHullCrack); i++) {
	var crackedHull = instance_find(objHullCrack, i);
		
	if (crackedHull.isActive) {
		numCrackedHulls++;	
	}
}

var numToCrack = floor((100 - global.hullStrength) / 5);

for (var i = numCrackedHulls; i < numToCrack; i++) {
	for (var j = 0; j < instance_number(objHullCrack); j++) {
		var crackedHull = instance_find(objHullCrack, j);
		
		if (crackedHull.isActive) {
			continue;	
		}
		
		crackedHull.isActive = true;
		break;
	}
}