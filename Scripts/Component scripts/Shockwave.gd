extends Node2D


#var shockwave_scale: Vector2 = Vector2(.1, .1)
var scale_increase_speed: float = 450
var scale_increase_speed_vector2: Vector2


func _ready():
	scale_increase_speed_vector2 = Vector2(scale_increase_speed, scale_increase_speed)


func _process(_delta):
	$ShockwaveArea2D.global_scale += scale_increase_speed_vector2 * _delta


func _on_shockwave_area_2d_body_shape_entered(_body_rid, _body, _body_shape_index, _local_shape_index):
	if _body.is_in_group("enemies"):
		_body.queue_free()
