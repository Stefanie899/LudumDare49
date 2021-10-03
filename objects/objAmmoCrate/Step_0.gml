/// @description Insert description here
// You can write your code in this editor
var dt = delta_time / 1000000;

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
	objDialogueHandler.startDialogue(["An ammo crate. Not sure why you'd need this on a peaceful transport vessel!"]);
	return;	
}

if (mouse_check_button(mb_left) && mouseHovered && canInteract && global.showTools) {
	ammoCounter += dt;
	
	if (ammoCounter >= timeToGetAmmo) {
		global.ammoLeft += 1;
	
		if (global.ammoLeft > global.maxAmmoLeft) {
			global.ammoLeft = global.maxAmmoLeft;	
		}
		
		ammoCounter = 0;
	}
}