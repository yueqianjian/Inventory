class_name Utils


static func getRandomItem():
	var path = "res://inventory/items/"
	var dir = DirAccess.open(path)
	var files = dir.get_files()
	var index = randi_range(0, files.size() - 1)
	var item_name = files[index]
	var resource = ResourceLoader.load(path + item_name)
	return resource


static func getRandomPosition(targetPosition: Vector2):
	var distance = Vector2.RIGHT * randf_range(100., 300.)
	var pos = distance.rotated(randf_range(0., TAU)) + targetPosition
	return pos
