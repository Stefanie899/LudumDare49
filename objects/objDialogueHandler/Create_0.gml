/// @description Insert description here
// You can write your code in this editor
global.inDialogue = false;
dialogues = array_create(0);
dialogueIndex = 0;

canProgress = true;

endScript = undefined;

function startDialogue(dialogueArray) {
	startDialogueWithScript(dialogueArray, undefined);
}

function startDialogueWithScript(dialogueArray, scriptToRun) {
	if (global.inDialogue) {
		return;	
	}
	
	dialogues = dialogueArray;
	dialogueIndex = 0;
	global.inDialogue = true;
	global.paused = true;
	canProgress = false;
	
	endScript = scriptToRun;
}