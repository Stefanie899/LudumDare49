/// @description Insert description here
// You can write your code in this editor
if (global.tutorialFinished) {
	instance_destroy();	
}

if (global.paused || global.inDialogue) {
	return;	
}

if (global.distanceRemaining <= 12000 && !global.showHealth) {
	objDialogueHandler.startDialogueWithScript([
	"The humans are sleeping soundly. Why don't we take a look at their health? Human health" +
	" will be displayed in the top left of the screen."], scrShowHumanHealth);
}

if (global.distanceRemaining <= 11000 && !global.lifeSupportFailing) {
	objDialogueHandler.startDialogueWithScript([
	"Something is wrong... Looks like the life support is beginning" +
	" to have issues. Better keep an eye on it! System efficiency is shown in the top left of your screen," +
	" next to human health. When it starts to fall, you should find the system on the ship and fix it up!"], scrLifeSupportStartsFailing);
}

if (global.distanceRemaining <= 10000 && !global.autoPilotFailing) {
	objDialogueHandler.startDialogue([
	"Uh oh, looks like the autopilot is on the fritz now. You'll need to keep it up and running" +
	" or eventually the ship will stop moving and you'll never get these humans home! You should find" +
	" the autopilot now and get it working at maximum efficiency."]);
	global.autoPilotFailing = true;
}

if (global.distanceRemaining <= 9000 && !global.glorbsAttacking) {
	objDialogueHandler.startDialogue([
	"The ship has detected a Glorb onboard! Luckily, UNSTABLE is equipped with a gun for just these situations!" +
	" Press 3 to equip your gun and take the Glorb out before they start sucking the life from the humans."]);
	global.showTools = true;
	global.glorbsAttacking = true;
}

if (global.distanceRemaining <= 6000 && !global.firesFiring) {
	objDialogueHandler.startDialogue([
	"Looks like the engines have been working too hard, fires may start breaking out in the engine room now." +
	" Make sure to put them out before they spread uncontrollably! Press 1 to switch to the fire extinguisher." +
	" If you run out, find the fire extinguisher reservoir to refill your mobile extinguisher."]);
	global.firesFiring = true;
}

if (global.hullStrength <= global.maxHullStrength - 5 && !global.explainedHull) {
	objDialogueHandler.startDialogue([
	"Looks like your hull has taken some damage, that's gonna slow us down! There are airlocks on either side of the ship that lead" +
	" into the cold expanse of space. Luckily UNSTABLE doesn't need oxygen! Use your welding tool to fix" +
	" the cracks in the ships hull. You can press 2 to switch to the welder. If you run out of gas, find" +
	" the welding reservoir to refill your mobile welding tool."]);
	global.explainedHull = true;

}

if (global.explainedHull && global.firesFiring && global.glorbsAttacking && global.lifeSupportFailing && global.showHealth && global.autoPilotFailing) {
	instance_destroy();
}