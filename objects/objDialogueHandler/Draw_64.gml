/// @description Insert description here
// You can write your code in this editor
if (global.inDialogue) {
	draw_set_color(c_black);
	draw_set_alpha(0.2);
	draw_rectangle(0, 0, window_get_width(), window_get_height(), false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	draw_sprite_stretched(sprDialogue, 0, 16, window_get_height() - 256, window_get_width() - 32, 240);
	
	draw_text_ext(32, window_get_height() - 240, dialogues[dialogueIndex], 32, window_get_width() - 64);
}