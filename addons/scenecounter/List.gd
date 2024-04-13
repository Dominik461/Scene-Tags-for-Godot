@tool
extends OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	var c = 0
	for i in 3:
		var t = "Test " + str(c)
		c += 1
		add_item(t)

