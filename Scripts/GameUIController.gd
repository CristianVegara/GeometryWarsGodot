extends CanvasLayer


var icon_array = []


func _ready():
	for i in range(get_child_count()):
		var child = get_child(i)
		icon_array.append(child)

func _process(_delta):
	var player_lifes_left = $"..".player_lifes
	if player_lifes_left < icon_array.size():
		var last_array_index = icon_array.size() -1
		var last_array_item = icon_array[last_array_index]
		last_array_item.queue_free()
		icon_array.remove_at(last_array_index)
