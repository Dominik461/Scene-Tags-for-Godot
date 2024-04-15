@tool
extends Node

enum SceneType {
	
	ENEMY,
	PLAYER,
	LEVEL,
	OBSTACLE,
	INTERACTABLE,
	ITEMS,
	COLLACTABLE
	
}

@export
var tag : SceneType
		

func _ready():
	pass

func _process(delta):
	pass


func _on_renamed():
	if(name != "scene_tag"):
		set_name("scene_tag")
