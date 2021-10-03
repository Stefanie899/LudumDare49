/// @description Insert description here
spawnGunk();

if (!global.explainedLifeSupport) {
	objDialogueHandler.startDialogue(["Looks like some gunk built up in the life support system, and it's" +
	" effecting the efficiency. Use your mouse to drag the gunk out the bottom of the life support system." +
	" Careful, if the efficiency drops too low, the humans on board will start to die! Press ESC to return to the ship."]);
	global.explainedLifeSupport = true;	
}