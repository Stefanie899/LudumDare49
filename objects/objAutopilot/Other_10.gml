/// @description Insert description here
// You can write your code in this editor
if (global.autoPilotFailing) {
	room_goto(rmAutopilotGame);
} else {
	objDialogueHandler.startDialogue(["This is the autopilot for the ship. Seems to be working great!"]);	
}