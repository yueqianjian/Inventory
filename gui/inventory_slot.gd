extends PanelContainer

@onready var inventory_cell = $InventoryCell

var itemSlot: InventorySlot = InventorySlot.new()
var inventories_container


func _ready():
	inventories_container = get_tree().get_first_node_in_group("InventoriesContainer")


func update():
	inventory_cell.update(itemSlot)


func switchState(state = true):
	if state:
		inventory_cell.modulate = Color(1, 1, 1, 0.5)
	else:
		inventory_cell.modulate = Color(1, 1, 1, 1)


func _on_gui_input(event: InputEvent):
	if event.is_action_pressed("mouse_left"):
		if !inventories_container:
			return
		
		inventories_container.onMouseItemClick(self)
