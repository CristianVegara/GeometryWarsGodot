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
	
	#TODO limpiarlo
	var enemy_spawn_area = $PlayArea/CollisionShape2D as CollisionShape2D
	var bottom_right_vertex = Vector2(enemy_spawn_area.get_shape().size.x,enemy_spawn_area.get_shape().size.y)
	var top_left_vertex = enemy_spawn_area.global_position - (bottom_right_vertex - enemy_spawn_area.global_position)
	
	var random_x = randi() % int( bottom_right_vertex.x - top_left_vertex.x ) + 1 + top_left_vertex.x
	var random_y =  randi() % int( bottom_right_vertex.y - top_left_vertex.y ) + 1 + top_left_vertex.y
	
	var random_pos = Vector2(random_x, random_y)
	instance.global_position = random_pos
	
	#escalado enemigo cuando spawnean
	instance.global_scale = Vector2(3,3)
	
	add_child(instance)
	


func _on_player_spawn_timer_timeout():
	spawn_player()


func _on_enemy_spawn_timer_timeout():
	spawn_enemy()
