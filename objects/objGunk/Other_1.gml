/// @description Insert description here
// You can write your code in this editor
instance_destroy();

global.lifeSupportEfficiency += 10;

if (global.lifeSupportEfficiency > 100) {
	global.lifeSupportEfficiency = 100;
}