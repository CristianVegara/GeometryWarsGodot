extends Node2D


# Despawns bullet after it has collided with anything
func _on_projectile_area_2d_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if _body.is_in_group("enemies"):
		_body.queue_free()
	queue_free()
