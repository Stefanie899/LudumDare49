/// @description Insert description here
// You can write your code in this editor
if (!global.explainedAutopilot) {
	objDialogueHandler.startDialogue(["Looks like the autopilot is working too hard. You'll have to manually" +
	" drive the ship and get it recharged. Pick up the green dots and avoid the asteroids to help recharge" +
	" the autopilot. If the autopilot efficiency drops, the ship will slow down. Press ESC to return to the ship."]);
	global.explainedAutopilot = true;	
}