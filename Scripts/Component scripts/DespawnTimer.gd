extends Timer


@export var debug_exit_message: bool


func _exit_tree():
	var parent_name = $"..".name
	if debug_exit_message:
		print(parent_name, " queue free")


func _on_timeout():
	$"..".queue_free()
