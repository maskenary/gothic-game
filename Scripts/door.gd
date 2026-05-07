extends Area2D

class_name Door

@export var destination: Node
@onready var anim_sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("player")

@export var locked = false
var active = false

func _on_body_entered(body: Node2D) -> void:
	active = true
	if body.is_in_group("player"):
		anim_sprite.play("open")
		
func _on_body_exited(body: Node2D) -> void:
	active = false
	if body.is_in_group("player"):
		anim_sprite.play_backwards("open")

func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_accept") && active && player.can_interact:
		player.global_position = destination.global_position
		player.global_position.y += 12 # ADJUSTMENT, CHANGE THIS LATER, RETARD CODING
		destination.anim_sprite.set_frame(2)
