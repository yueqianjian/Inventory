extends Node2D

@onready var sprite_2d = $Sprite2D

var item: InventoryItem


func _ready():
	item = Utils.getRandomItem()
	sprite_2d.texture = item.icon

