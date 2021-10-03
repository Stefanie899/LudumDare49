/// @description Insert description here
// You can write your code in this editor
if (!canProgress && !mouse_check_button(mb_left)) {
	canProgress = true;	
}

if (mouse_check_button_pressed(mb_left && global.inDialogue) && canProgress) {
	dialogueIndex++;
	
	if (dialogueIndex >= array_length(dialogues)) {
		global.inDialogue = false;
		global.paused = false;
		
		if (!is_undefined(endScript)) {
			script_execute(endScript);
			endScript = undefined;
		}
	}
}