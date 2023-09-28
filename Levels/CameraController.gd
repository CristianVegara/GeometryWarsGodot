extends Camera2D


var player_node


func _process(_delta):
	if player_node == null:
		player_node = $"../Player"
