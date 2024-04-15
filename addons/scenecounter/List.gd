@tool
extends OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	clear()
	add_item("ENEMY")
	add_item("PLAYER")
	add_item("LEVEL")
	add_item("OBSTACLE")
	add_item("INTERACTABLE")
	add_item("ITEMS")
	add_item("COLLACTABLE")
