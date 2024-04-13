@tool
extends EditorPlugin

var dock

func _enter_tree():
	# Initialization of the plugin goes here.
	dock = preload("res://addons/scenecounter/scene_tags.tscn").instantiate()
	add_custom_type("scene_tag", "Node", preload("scene_tag.gd"), preload("icon.png"))
	add_control_to_dock(DOCK_SLOT_LEFT_BL, dock)



func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("scene_tag")
	remove_control_from_docks(dock)
	dock.free()
