extends Camera2D

var grid_size = Vector2(1920, 1080)
@onready var parent = get_parent()
	
func _process(delta: float) -> void:
	var x = floor(parent.global_position.x / grid_size.x)
	var y = floor(parent.global_position.y / grid_size.y)
	global_position = Vector2(x * grid_size.x, y * grid_size.y)
