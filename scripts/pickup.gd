extends Area2D
class_name Pickup


func _on_area_entered(area: Area2D):
	if not area is Pickupable:
		return
	
	print(area.owner.item.name)
