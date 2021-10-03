/// @description Insert description here
// You can write your code in this editor
if (!isActive) {
	return;	
}

var increment = 0.8 / maxHealth;
var alpha = 1 - ((maxHealth - curHealth) * increment);

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, alpha);