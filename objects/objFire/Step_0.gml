/// @description Insert description here
// You can write your code in this editor
if (global.paused) {
	return;	
}

if (numTimesSpread >= numToSpread) {
	return;
}

var dt = delta_time / 1000000;

counter += dt;

if (counter >= timeToSpread) {
	spreadFire();
}