class_name Tools


## Return a Vector2 of the forward trajectory. Must be .normalized()
## to be used as direction, otherwise it will return a Vector2 position.
static func vector_direction( a:Vector2, b:Vector2 ):
	return ( b - a ) + b


## Returns a random Vector2 given a range between A and B, both are inclusive
static func random_vector2(A: Vector2, B: Vector2) -> Vector2:
	var random_x = randf_range(A.x, B.x)
	var random_y = randf_range(A.y, B.y)
	
	return Vector2(random_x, random_y)
