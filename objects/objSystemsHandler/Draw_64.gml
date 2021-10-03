/// @description Insert description here
// You can write your code in this editor
var drawY = 0;

draw_set_halign(fa_right);

if (fireBrokenOut) {
	draw_text(window_get_width() - 16, drawY, "A fire has broken out in the engine room!");
	drawY += 16;
}

if (enemyPresent) {
	draw_text(window_get_width() - 16, drawY, "A glorb is on the ship!");
	drawY += 16;
}

draw_set_halign(fa_left);	

drawBars();

drawDistanceBar();

drawTools();