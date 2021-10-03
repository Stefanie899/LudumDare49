// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawVerticalGuiBar(startX, startY, width, height, color, maxValue, value, icon) {
	draw_set_color(c_white);
	draw_rectangle(startX, startY, startX + width, startY + height, true);

	var step = height / maxValue;

	draw_set_color(c_black);
	draw_rectangle(startX + 1, startY + 1, startX + width - 1, startY + height - 1, false);
	
	draw_set_color(color);
	draw_rectangle(startX + 1, startY + height, startX + width - 1, startY + height - (value * step), false);

	draw_set_color(c_white);

	var percentage = (value / maxValue) * 100;

	draw_set_halign(fa_center);
	draw_text_ext_transformed(startX - 2, startY + (height / 2), string(percentage) + "%", 0, 100, 1, 1, 90);
	draw_set_halign(fa_left);
	
	draw_set_color(c_white);
	
	draw_sprite(icon, 0, startX + 1, startY + height + 8);
}

function drawToolsGui(startX, startY, selectedIndex) {
	drawTool(startX, startY, sprExtinguisherIcon, selectedIndex == 1, global.extinguisherLeft, global.maxExtinguisherLeft);
	drawTool(startX + 48, startY, sprWelderIcon, selectedIndex == 2, global.welderLeft, global.maxWelderLeft);
	drawTool(startX + 96, startY, sprGunIcon, selectedIndex == 3, global.ammoLeft, global.maxAmmoLeft);
}

function drawTool(startX, startY, icon, isSelected, value, maxValue) {
	draw_set_color(c_white);
	
	if (isSelected) {
		draw_set_color(c_green);	
	}
	
	draw_rectangle(startX, startY, startX + 32, startY + 32, true);
	
	draw_set_color(c_dkgrey);
	
	if (isSelected) {
		draw_set_color(c_grey);	
	}
	
	draw_rectangle(startX + 1, startY + 1, startX + 31, startY + 31, false);
	
	draw_sprite(icon, 0, startX + 8, startY + 8);
	
	
	draw_set_color(c_white);
	
	draw_rectangle(startX, startY + 33, startX + 32, startY + 41, true);

	var step = 32 / 100;
	var percentage = (value / maxValue) * 100;

	draw_set_color(c_green);
	draw_rectangle(startX + 1, startY + 34, startX + percentage * step, startY + 40, false);

	draw_set_color(c_white);
}