extends Panel

@onready var inventory_gui = $InventoryGui
@onready var inventory_cell = $InventoryCell

var isMouseItemVisible = false
var itemSlotNode


func _input(event: InputEvent):
	if event.is_action_pressed("bag"):
		visible = !visible
		inventory_gui.visible = !inventory_gui.visible
	
	if event.is_action_pressed("mouse_right"):
		isMouseItemVisible = false


func _process(delta):
	if isMouseItemVisible:
		inventory_cell.position = get_viewport().get_mouse_position()
	else:
		inventory_cell.visible = false


func onMouseItemClick(slotNode):
	# 鼠标无，点击无
	if !itemSlotNode && slotNode.itemSlot.isEmpty():
		return
	# 鼠标无，点击有
	if !itemSlotNode && !slotNode.itemSlot.isEmpty():
		itemSlotNode = slotNode
		slotNode.switchState(true)
		isMouseItemVisible = true
		inventory_cell.update(slotNode.itemSlot)
		inventory_cell.visible = true
		return
	# 鼠标有，点击无
	if itemSlotNode && slotNode.itemSlot.isEmpty():
		slotNode.itemSlot = itemSlotNode.itemSlot
		slotNode.update()

		itemSlotNode.itemSlot = InventorySlot.new()
		itemSlotNode.update()
		itemSlotNode.switchState(false)
		itemSlotNode = null
		isMouseItemVisible = false
		return
	# 鼠标有，点击有
	if itemSlotNode && !slotNode.itemSlot.isEmpty():
		if itemSlotNode == slotNode:
			clearMouseItem()
			return
		var itemSlot = itemSlotNode.itemSlot
		itemSlotNode.itemSlot = slotNode.itemSlot
		itemSlotNode.update()
		itemSlotNode.switchState(false)
		
		slotNode.switchState(false)
		slotNode.itemSlot = itemSlot
		slotNode.update()
		
		clearMouseItem()


func createMouseItem(slotNode):
	itemSlotNode = slotNode
	itemSlotNode.switchState(true)
	isMouseItemVisible = true
	inventory_cell.update(slotNode.itemSlot)
	inventory_cell.visible = true


func clearMouseItem():
	itemSlotNode.switchState(false)
	itemSlotNode = null
	isMouseItemVisible = false
