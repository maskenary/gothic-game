extends Area2D

class_name Door

@export var destination: Marker2D
@onready var sprite = $Sprite2D
var open_texture = preload("res://Assets//door_open.png")
var closed_texture = preload("res://Assets//door_closed.png")

var active = false

func _on_body_entered(body: Node2D) -> void:
	active = true
	if body is Player:
		sprite.texture = open_texture
		
func _on_body_exited(body: Node2D) -> void:
	active = false
	if body is Player:
		sprite.texture = closed_texture

func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_accept") && active == true: # Default "Enter" or "Space"
		var player = get_tree().get_first_node_in_group("player")
		player.global_position = destination.global_position
