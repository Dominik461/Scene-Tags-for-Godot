@tool
extends Control

var change_list = true
var data_received
var tag_option_node
var scene_list
var counter_label
var button_scene = load("res://addons/scenecounter/scene_button.tscn")

func _ready():
	tag_option_node = $"Project/Tag Select/List" as OptionButton
	scene_list = $"Project/Scene List" as VBoxContainer
	counter_label = $"Project/Tag Select/LineEdit" as LineEdit
	tag_option_node.item_selected.connect(on_tag_selected)

func _process(delta):

	if change_list:
		
		for n in scene_list.get_children():
			scene_list.remove_child(n)
			n.queue_free()
		
		var json = JSON.new()
		var file = FileAccess.open("res://addons/scenecounter/tag_data.data", FileAccess.READ)
		var error = json.parse(file.get_as_text())
		
		
		if error == OK:
			data_received = json.data
			
		
			for key in data_received:
				if data_received[key] == str(tag_option_node.selected):					
					var button = button_scene.instantiate()
					button.init(key.get_file())
					scene_list.add_child(button)
		
			
			counter_label.text = str(scene_list.get_child_count(true)) + " scene/s"


		change_list = false

func on_tag_selected(index : int) -> void:
	change_list = true

