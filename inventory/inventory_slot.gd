extends Resource
class_name InventorySlot

@export var item: InventoryItem
@export var count: int


func isEmpty():
	return count <= 0
