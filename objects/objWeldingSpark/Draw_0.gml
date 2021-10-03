/// @description Insert description here
// You can write your code in this editor
var increment = 0.5 / timeToLive;
var alpha = 1 - (counter * increment);

draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, rotation, c_white, alpha);