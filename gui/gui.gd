extends CanvasLayer

const ITEM = preload("res://inventory/item.tscn")


func _on_button_pressed():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if !player:
		return
	
	var pos = Utils.getRandomPosition(player.global_position)
	var item = ITEM.instantiate()
	item.global_position = pos
	var itemsNode = get_tree().get_first_node_in_group("items")
	itemsNode.add_child(item)
