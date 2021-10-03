/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, text);
draw_set_halign(fa_left);
draw_set_valign(fa_top);