@tool
extends EditorPlugin

var scene_tag = preload("res://addons/scenecounter/scripts/scene_tag.gd")
var dock

func _enter_tree():
	# Initialization of the plugin goes here.
	dock = preload("res://addons/scenecounter/scene_tags.tscn").instantiate()
	add_custom_type("scene_tag", "Node", scene_tag, preload("../icon.png"))
	add_control_to_dock(DOCK_SLOT_LEFT_BL, dock)
	var d = dock as Control
	d.custom_minimum_size = Vector2(200,0)

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("scene_tag")
	remove_control_from_docks(dock)
	dock.free()
	
func _save_external_data():
		
		var filepaths = getFilePathsByExtension("res://", "tscn", true)
		var scene_tags = {}
		for filepath in filepaths:
			var scene = load(filepath)
			if scene:
				var instance = scene.instantiate()
				for child in instance.get_children():
					if child.name == "scene_tag":
						scene_tags[str(child.tag)] = filepath
						continue
		
		var file = FileAccess.open("res://addons/scenecounter/tag_data.data", FileAccess.WRITE)
		file.store_string(str(scene_tags))
		#print(scene_tags)
	
func getFilePathsByExtension(directoryPath: String, extension: String, recursive: bool = true) -> Array:
	var dir = DirAccess.open(directoryPath)
	if !dir:
		printerr("Warning: could not open directory: ", directoryPath)
		return []

	if dir.list_dir_begin() != OK:
		printerr("Warning: could not list contents of: ", directoryPath)
		return []

	var filePaths = []
	var fileName = dir.get_next()
	while fileName != "":
		if dir.current_is_dir():	
			if recursive:
				var dirPath = dir.get_current_dir() + "/" + fileName
				filePaths += getFilePathsByExtension(dirPath, extension, recursive)
		else:
			if fileName.get_extension() == extension:
				
				var filePath = dir.get_current_dir() + "/" + fileName
				filePaths.append(filePath)
	
		fileName = dir.get_next()
	return filePaths
