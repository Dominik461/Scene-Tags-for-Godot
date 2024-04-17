@tool
extends Node

enum SceneType {
	
	ENEMY,
	PLAYER,
	LEVEL,
	OBSTACLE,
	INTERACTABLE,
	ITEMS,
	COLLACTABLE,
	BACKGROUND
	
}

@export
var tag : SceneType

func _ready():
	self.renamed.connect(_on_renamed)


func _on_renamed():
	if(name != "scene_tag"):
		set_name("scene_tag")
