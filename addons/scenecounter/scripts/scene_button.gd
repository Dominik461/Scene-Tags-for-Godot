@tool
extends Button

var displayedName
var scenePath
#var editor_settings
var test_button = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	#editor_settings = EditorInterface.get_editor_settings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setName(Name):
	text = Name
	scenePath = Name
	


func _on_pressed():	
	#var editor_settings = EditorInterface.get_editor_settings()
	#print(editor_settings)
	EditorInterface.open_scene_from_path(scenePath)
	
	
