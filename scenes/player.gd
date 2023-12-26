extends CharacterBody2D

@onready var pickup = $Pickup

const BAG_INVENTORY = preload("res://inventory/bagInventory.tres")

var currentSpeed = 300.0


func _ready():
	pickup.pickup.connect(on_pickup)


func _physics_process(delta):
	move()



func move():
	var direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = direction * currentSpeed
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func on_pickup(item: InventoryItem):
	BAG_INVENTORY.add(item)
