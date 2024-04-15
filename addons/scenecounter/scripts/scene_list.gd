@tool
extends Control

var changeList = true
var data_received
var listNode
var sceneList
var counterLabel
var sceneButton_scene = load("res://addons/scenecounter/scene_button.tscn")

func _ready():
	listNode = $"Project/Tag Select/List" as OptionButton
	sceneList = $"Project/Scene List" as VBoxContainer
	counterLabel = $"Project/Tag Select/LineEdit" as LineEdit
	listNode.item_selected.connect(on_tag_selected)

func _process(delta):

	if changeList:
		
		for n in sceneList.get_children():
			sceneList.remove_child(n)
			n.queue_free()
		#print(listNode)
		#print(listNode.selected)
		
		var json = JSON.new()
		var file = FileAccess.open("res://addons/scenecounter/tag_data.data", FileAccess.READ)
		var error = json.parse(file.get_as_text())
		
		#print("Error " + str(error))
		
		if error == OK:
			data_received = json.data
			
			#print("Type")
			#print(type_string(typeof(data_received)))
			for key in data_received.keys():
				if key == str(listNode.selected):					
					var sceneButton = sceneButton_scene.instantiate()
					sceneButton.setName(data_received[key].get_file())
					sceneList.add_child(sceneButton)
					#itemList.add_item(data_received[key])
			
			counterLabel.text = str(sceneList.get_child_count(true)) + " scene/s"


		changeList = false

func on_tag_selected(index : int) -> void:
	changeList = true

