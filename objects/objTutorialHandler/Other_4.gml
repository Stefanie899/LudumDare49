/// @description Insert description here
// You can write your code in this editor
if (!global.tutorialStarted) {
	objDialogueHandler.startDialogueWithScript([
		"Uniform Non Sentient Techno Assistant Bot Limited Edition, or UNSTABLE for short, is in charge" +
		" of ensuring the humans aboard this spaceship make it home safe and sound. Unfortunately, things" +
		" are about to get a bit messy around here...",
		"Use WSAD to move UNSTABLE around, and the mouse to interact or use tools."
	], scrIntroFinished);
	
	global.tutorialStarted = true;
}