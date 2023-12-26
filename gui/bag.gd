extends Panel

@onready var itemSlots = %ItemContainer.get_children()

const BAG_INVENTORY = preload("res://inventory/bagInventory.tres")

var slots: Array[InventorySlot]


func _ready():
	slots = BAG_INVENTORY.slots
	BAG_INVENTORY.updated.connect(update)
	update()
	BAG_INVENTORY.init(itemSlots.size())


func _input(event: InputEvent):
	if event.is_action_pressed("bag"):
		visible = !visible


func update():
	for i in min(itemSlots.size(), slots.size()):
		itemSlots[i].itemSlot = slots[i]
		itemSlots[i].update()
