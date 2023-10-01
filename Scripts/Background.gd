extends Node


var background_sprite: Sprite2D


func _ready():
	background_sprite = $Background
	var offset = 93
	var y_pos = 0
	for y in range(44):
		for x in range(44):
			var new_node = background_sprite.duplicate()
			new_node.global_position += Vector2 (offset * x, y_pos)
			add_child(new_node)
		y_pos += offset
	background_sprite.queue_free()
