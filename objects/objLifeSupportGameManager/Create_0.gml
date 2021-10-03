/// @description Insert description here
// You can write your code in this editor
prevLifeSupport = global.lifeSupportEfficiency;

function spawnGunk() {
	var numToSpawn = (100 - global.lifeSupportEfficiency) / 10;
	
	numToSpawn -= instance_number(objGunk);
	
	spawnNumOnObject(numToSpawn, objGunk, objGunkSpawn);
}