// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function spawnMissingCollision(numToSpawn, objToSpawn){
	for (var i = 0; i < numToSpawn; i++) {
		var spawnX = random_range(0, room_width);
		var spawnY = random_range(0, room_height);
	
		var sprWidth = sprite_get_width(object_get_sprite(objToSpawn));
		var sprHeight = sprite_get_height(object_get_sprite(objToSpawn));
	
		while (tileMeetingByBox(spawnX - sprWidth / 2, spawnY - sprHeight / 2, spawnX + sprWidth / 2, spawnY + sprHeight / 2, "Collision")) {
			spawnX = random_range(0, room_width);
			spawnY = random_range(0, room_height);
		}
	
		instance_create_layer(spawnX, spawnY, "Instances", objToSpawn);
	}
}

function spawnNumOnObject(numToSpawn, objToSpawn, objToSpawnOn) {
	for (var i = 0; i < numToSpawn; i++) {
		spawnOnObject(objToSpawn, objToSpawnOn);
	}
}

function spawnOnObject(objToSpawn, objToSpawnOn) {
	var spawnX = random_range(objToSpawnOn.bbox_left, objToSpawnOn.bbox_right);
	var spawnY = random_range(objToSpawnOn.bbox_top, objToSpawnOn.bbox_bottom);
	
	var sprWidth = sprite_get_width(object_get_sprite(objToSpawn));
	var sprHeight = sprite_get_height(object_get_sprite(objToSpawn));
		
	while (tileMeetingByBox(spawnX - sprWidth / 2, spawnY - sprHeight / 2, spawnX + sprWidth / 2, spawnY + sprHeight / 2, "Collision")) {
		var spawnX = random_range(objToSpawnOn.bbox_left, objToSpawnOn.bbox_right);
		var spawnY = random_range(objToSpawnOn.bbox_top, objToSpawnOn.bbox_bottom);
	}
	
	instance_create_layer(spawnX, spawnY, "Instances", objToSpawn);
}