// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tileMeeting(checkX, checkY, layer) {
	var tileMap = layer_tilemap_get_id(layer_get_id(layer));
	
	if (tileMap == -1) {
		return false;	
	}
	
	var _x1 = tilemap_get_cell_x_at_pixel(tileMap, bbox_left + (checkX - x), y),
    _y1 = tilemap_get_cell_y_at_pixel(tileMap, x, bbox_top + (checkY - y)),
    _x2 = tilemap_get_cell_x_at_pixel(tileMap, bbox_right + (checkX - x), y),
    _y2 = tilemap_get_cell_y_at_pixel(tileMap, x, bbox_bottom + (checkY - y));

	for(var _x = _x1; _x <= _x2; _x++ ){
		for(var _y = _y1; _y <= _y2; _y++) {
			if(tile_get_index(tilemap_get(tileMap, _x, _y))) {
				return true;
			}
		}
	}

	return false;
}

function tileMeetingByBox(startX, startY, endX, endY, layer) {
	var tileMap = layer_tilemap_get_id(layer_get_id(layer));
	
	if (tileMap == -1) {
		return false;	
	}
	
	var _x1 = tilemap_get_cell_x_at_pixel(tileMap, startX, startY),
    _y1 = tilemap_get_cell_y_at_pixel(tileMap, startX, startY),
    _x2 = tilemap_get_cell_x_at_pixel(tileMap, endX, endY),
    _y2 = tilemap_get_cell_y_at_pixel(tileMap, endX, endY);

	for(var _x = _x1; _x <= _x2; _x++ ){
		for(var _y = _y1; _y <= _y2; _y++) {
			if(tile_get_index(tilemap_get(tileMap, _x, _y))) {
				return true;
			}
		}
	}

	return false;
}