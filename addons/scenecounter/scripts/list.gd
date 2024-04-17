@tool
extends OptionButton
var scene_tag = preload("res://addons/scenecounter/scripts/scene_tag.gd")
# Called when the node enters the scene tree for the first time.
func _ready():
	clear()
	for key in scene_tag.SceneType:
		add_item(key)
