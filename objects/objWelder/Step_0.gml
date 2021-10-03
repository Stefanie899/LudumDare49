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

if (mouse_check_button_pressed(mb_left) && !global.showTools && mouseHovered && canInteract) {
	objDialogueHandler.startDialogue(["A huge welding chemical reservoir. Good thing the ship isn't damaged at all!"]);
	return;	
}

if (mouse_check_button(mb_left) && mouseHovered && canInteract && global.showTools) {
	global.welderLeft += 1;
	
	if (global.welderLeft > 100) {
		global.welderLeft = 100;	
	}
}