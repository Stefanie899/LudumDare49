/// @description Insert description here
// You can write your code in this editor
randomize();

global.grid = mp_grid_create(0, 0, room_width / 16, room_height / 16, 16, 16);

var tileMap = layer_tilemap_get_id(layer_get_id("Collision"));

for (var _x = 0; _x < tilemap_get_width(tileMap); _x++) {
	for (var _y = 0; _y < tilemap_get_height(tileMap); _y++) {
		if (tile_get_index(tilemap_get(tileMap, _x, _y))) {
			mp_grid_add_cell(global.grid, _x, _y);	
		}
	}
}

function drawBars() {
	if (room == rmMainMenu) {
		return;	
	}
	
	if (global.showHealth) {
		drawVerticalGuiBar(16, 16, 16, 128, c_red, global.maxHumanHealth, global.humanHealth, sprHeartIcon);
	}
	
	if (global.lifeSupportFailing) {
		drawVerticalGuiBar(48, 16, 16, 128, c_green, global.maxLifeSupportEfficiency, global.lifeSupportEfficiency, sprLifeSupportIcon);
	}
	
	if (global.autoPilotFailing) {
		drawVerticalGuiBar(80, 16, 16, 128, c_blue, global.maxAutoPilotEfficiency, global.autoPilotEfficiency, sprAutoPilotIcon);
	}
	
	if (global.explainedHull) {
		drawVerticalGuiBar(112, 16, 16, 128, c_gray, global.maxHullStrength, global.hullStrength, sprHullIcon);
	}
}

function drawTools() {
	if (!global.showTools || room != rmShip || global.inDialogue || room == rmMainMenu) {
		return;	
	}
	
	drawToolsGui(window_get_width() / 2 - 48, window_get_height() - 64, objPlayer.selectedTool);
}

function drawDistanceBar() {
	if (!global.isTravelling || global.inDialogue || room == rmMainMenu) {
		return;	
	}
	
	draw_set_color(c_white);
	draw_rectangle(16, window_get_height() - 16, window_get_width() - 16, window_get_height() - 8, true);

	var distanceStep = 256 / 100;
	var progressPercentage = (global.distanceRemaining / global.startingDistance) * 100;

	draw_set_color(c_green);
	draw_rectangle(17, window_get_height() - 15, 17 + (100 - progressPercentage) * distanceStep, window_get_height() - 9, false);

	draw_set_color(c_white);

	draw_set_valign(fa_middle);
	draw_text(16, window_get_height() - 32, "Distance Remaining: " + string(global.distanceRemaining) + " km");
	draw_set_valign(fa_top);	
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
	draw_text(window_get_width() - 16, window_get_height() - 32, "Travelling Speed: " + string(global.shipSpeed) + " km/h");
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);	
}

function reset() {
	global.mouseOverInteractable = false;
	global.paused = false;

	global.glorbsAttacking = false;
	global.firesFiring = false;
	global.lifeSupportFailing = false;
	global.autoPilotFailing = false;
	global.isTravelling = false;
	global.showTools = false;
	global.showHealth = false;

	global.maxLifeSupportEfficiency = 100;
	global.lifeSupportEfficiency = global.maxLifeSupportEfficiency;

	global.maxAutoPilotEfficiency = 100;
	global.autoPilotEfficiency = global.maxAutoPilotEfficiency;

	global.maxHullStrength = 100;
	global.hullStrength = global.maxHullStrength;

	global.maxHumanHealth = 1500;
	global.humanHealth = global.maxHumanHealth;

	global.maxExtinguisherLeft = 100;
	global.extinguisherLeft = global.maxExtinguisherLeft;

	global.maxWelderLeft = 100;
	global.welderLeft = global.maxWelderLeft;

	global.maxAmmoLeft = 10;
	global.ammoLeft = global.maxAmmoLeft;

	global.maxShipSpeed = 125000;
	global.shipSpeed = global.maxShipSpeed;
	global.startingDistance = 12500;
	global.distanceRemaining = global.startingDistance;
	
	global.tutorialStarted = false;
	global.tutorialFinished = false;

	global.explainedLifeSupport = false;
	global.explainedAutopilot = false;
	global.explainedHull = false;

	lifeSupportTimer = 0;
	fireTimer = 0;
	autoPilotTimer = 0;
	fireSpreadTimer = 0;
	enemyTimer = 0;

	fireBrokenOut = false;
	enemyPresent = false;

	timeToSpreadFire = 15;
	timesFireShouldSpread = 0;
	needsToSpreadFires = false;

	timeBetweenHealthTicks = 0.2;
	healthTickTimer = 0;
	
	needsCreateTutorial = true;
	
	instance_destroy(objFire);
	instance_destroy(objEnemy);
	
	for (var j = 0; j < instance_number(objHullCrack); j++) {
		var crackedHull = instance_find(objHullCrack, j);
		
		crackedHull.isActive = false;
	}
}

reset();