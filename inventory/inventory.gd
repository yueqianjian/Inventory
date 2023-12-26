extends Resource
class_name Inventory

signal updated

@export var slots: Array[InventorySlot]
@export var maxStackSize: int = 99


func init(size: int = 10):
	slots.resize(size)
	for i in size:
		if !slots[i]:
			slots[i] = InventorySlot.new()


func add(item: InventoryItem):
	if slots.is_empty():
		init()
	
	for i in slots.size():
		var slot = slots[i]
		
		if slot.item:
			if slot.item.name == item.name:
				slot.count += 1
				updated.emit()
				return
				
			continue
			
		else:
			slot.item = item
			slot.count = 1
			updated.emit()
			return
	
