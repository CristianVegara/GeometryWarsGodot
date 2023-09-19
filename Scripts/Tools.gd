class_name Tools

static func vector_direction( a:Vector2, b:Vector2 ):
	return ( b - a ) + b

enum ObjectType {
	Player,
	Enemy,
	Barrier,
	Projectile
}
