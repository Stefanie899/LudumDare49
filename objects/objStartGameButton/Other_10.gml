/// @description Insert description here
// You can write your code in this editor
global.gameStarted = true;
global.paused = false;
audio_play_sound(sndBackgroundMusic, 1, true);
global.resetGame = global.gameStarted ? false : true;
room_goto(rmShip);