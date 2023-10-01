extends Camera2D


var player_node: Node
var cameraSpeed = 5.0 


func _process(_delta):
	if player_node == null && $"../".has_node("Player"):
		player_node = $"../Player"
	
	if player_node != null:
		global_position = player_node.global_position
