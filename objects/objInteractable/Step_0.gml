/// @description Insert description here
// You can write your code in this editor
mouseHovered = false;

if (distance_to_object(objPlayer) > interactDistance) {
	return;
}

if (mouse_x >= x - sprite_get_xoffset(sprite_index) && 
	mouse_x <= x + sprite_width - sprite_get_xoffset(sprite_index) && 
	mouse_y >= y - sprite_get_yoffset(sprite_index)&& 
	mouse_y <= y - sprite_get_yoffset(sprite_index) + sprite_height) {
	global.mouseOverInteractable = true;
	mouseHovered = true;
}

if (mouse_check_button_pressed(mb_left) && mouseHovered && canInteract) {
	event_user(0);
}