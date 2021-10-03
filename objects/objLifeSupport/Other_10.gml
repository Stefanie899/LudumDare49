/// @description Insert description here
// You can write your code in this editor
if (global.lifeSupportFailing) {
	room_goto(rmLifeSupportGame);
} else {
	objDialogueHandler.startDialogue(["This is the life support system for the ship. Thank goodness there's no gunk clogging it up!"]);	
}