@tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("scene_tag", "Node", preload("scene_tag.gd"), preload("icon.png"))
	
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("scene_tag")
	pass
