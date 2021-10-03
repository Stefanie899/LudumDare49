/// @description Insert description here
// You can write your code in this editor
var increment = 196 / maxHealth;
var gb = 59 + (curHealth * increment);

var color = make_color_rgb(255, gb, gb);

draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, color, 1);