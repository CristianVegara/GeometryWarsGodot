extends Node


var playerScene = preload("res://Prefabs/Player.tscn")


func _ready():
	spawn_player()


func _process(delta):
	spawn_player()
	


func spawn_player():
	if not is_instance_valid(get_node("Player")):
		var instance = playerScene.instantiate()
		add_child(instance)
		print("Player was spawned!")
