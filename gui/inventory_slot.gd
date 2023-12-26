extends PanelContainer
class_name ItemSlot

@onready var icon = %Icon
@onready var count = %Count

var itemSlot: InventorySlot



func update():
	if !itemSlot || !itemSlot.item:
		return
	
	icon.texture = itemSlot.item.icon
	count.text = str(itemSlot.count)
