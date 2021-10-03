/// @description Insert description here
// You can write your code in this editor
var increment = 0.8 / maxLife;
var alpha = 1 - ((maxLife - life) * increment);

draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, c_white, alpha);