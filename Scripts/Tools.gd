class_name Tools

# TODO Falta comentar
static func vector_direction( a:Vector2, b:Vector2 ):
	return ( b - a ) + b


#TODO gestionar el spawn del enemigo, esta es la fórmula
#IMPORTANTE cambianr x_range e y_range por los vectores posicion del mapa
# y Vector2 de enemigo
#static func random_coordenades():
#	randomize()
#	var x_range = Vector2(0,100)
#	var y_range = Vector2(0,100)
#
#	var random_x = randi() % int( range[2].x - range[0].x ) + 1 + x_range[0]
#	var random_y =  randi() % int( range[3].y - range[0].y ) + 1 + y_range[0]
#
#	var random_pos = Vector2(random_x, random_y)
#
	# isntance = random_pos
