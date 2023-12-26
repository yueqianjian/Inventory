extends Area2D
class_name Pickup

signal pickup(item: InventoryItem)


func _on_area_entered(area: Area2D):
	if not area is Pickupable:
		return
	
	pickup.emit(area.owner.item)
	print(area.owner.item.name)
