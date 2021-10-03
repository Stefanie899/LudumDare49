// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scrShowHumanHealth() {
	global.showHealth = true;
}

function scrLifeSupportStartsFailing() {
	global.lifeSupportFailing = true;
}

function scrVictory() {
	room_goto(rmVictory);
}

function scrDefeat() {
	room_goto(rmDefeat);
}