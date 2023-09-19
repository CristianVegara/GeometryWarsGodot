extends Node


var playerScene = preload("res://Prefabs/Player.tscn")


func _ready():
	# Fixes blur player sprite on high refresh monitors
	Engine.max_fps = 60
	spawn_player()


func _process(_delta):
	check_player_exists()
	

func check_player_exists():
	if has_node("Player"):
		return
	if $PlayerSpawnTimer.is_stopped():
		$PlayerSpawnTimer.start()


func spawn_player():
	var instance = playerScene.instantiate()
	add_child(instance)
	print("Player spawned!")


func _on_player_spawn_timer_timeout():
	spawn_player()
