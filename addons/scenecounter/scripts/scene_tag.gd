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
