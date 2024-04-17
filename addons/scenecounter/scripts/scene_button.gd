@tool
extends Button


var scene_path
var test_button = $"."

func init(Name):
	text = Name
	scene_path = Name

func _on_pressed():
	
	if Engine.is_editor_hint():
		var arr_open_scenes = EditorInterface.get_open_scenes()
		var is_open = false
		for scene in arr_open_scenes:
			if scene.ends_with(scene_path):
				is_open = true
				break 

		if !is_open:
			EditorInterface.open_scene_from_path(scene_path)
