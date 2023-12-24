extends Area2D
class_name Pickupable


func _on_area_entered(area: Area2D):
	if not area is Pickup:
		return
	
	owner.queue_free()
