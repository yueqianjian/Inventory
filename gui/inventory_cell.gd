extends MarginContainer

@onready var icon = %Icon
@onready var count = %Count



func update(itemSlot: InventorySlot):
	if !itemSlot || itemSlot.isEmpty():
		icon.texture = null
		count.text = ""
		return
	
	icon.texture = itemSlot.item.icon
	count.text = str(itemSlot.count)
