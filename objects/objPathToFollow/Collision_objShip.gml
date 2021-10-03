/// @description Insert description here
// You can write your code in this editor
instance_destroy();

global.autoPilotEfficiency += 1;

if (global.autoPilotEfficiency > 100) {
	global.autoPilotEfficiency = 100;	
}