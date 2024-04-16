@tool
extends Button


var scene_path
var test_button = $"."

func init(Name):
	text = Name
	scene_path = Name

func _on_pressed():	
	EditorInterface.open_scene_from_path(scene_path)	
