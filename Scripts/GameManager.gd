extends Node


var player_scene = preload("res://Scenes/Player.tscn")
var enemy_scene = preload("res://Scenes/Enemy.tscn")

#buscar coordenada random menos encima del jugadorx
#aplicar escala enemigo
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
	var instance = player_scene.instantiate()
	add_child(instance)


func spawn_enemy():
	var instance = enemy_scene.instantiate()
	instance.scale = instance.enemy_size
	
	#TODO generar coordenadas spawnrandom
	var enemy_spawn_area = $PlayArea/CollisionShape2D as CollisionShape2D
	var area_shape = enemy_spawn_area as ConvexPolygonShape2D
	var vertices = area_shape.get_shape().get_points()

	var random_x = randf() * 0
	add_child(instance)


func _on_player_spawn_timer_timeout():
	spawn_player()


func _on_enemy_spawn_timer_timeout():
	spawn_enemy()
