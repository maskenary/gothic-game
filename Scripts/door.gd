extends Area2D

class_name Door

@export var destination: Node
@onready var anim_sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("player")

@export var locked = false
var active = false

func _ready() -> void:
	if locked:
		anim_sprite.play("locked")

func _on_body_entered(body: Node2D) -> void:
		active = true
		if body.is_in_group("player") && !locked:
			anim_sprite.play("open")
		
func _on_body_exited(body: Node2D) -> void:
		active = false
		if body.is_in_group("player") && !locked:
			anim_sprite.play_backwards("open")

func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_accept") && active && player.can_interact:
		if locked:
			var key_index = player.inventory.find("key")
			print(key_index)
			if key_index != -1:
				player.inventory.remove_at(key_index)
				print(player.inventory)
				locked = false
				anim_sprite.play("open")
		else:
			player.global_position = destination.global_position
			player.global_position.y += 12 # ADJUSTMENT, CHANGE THIS LATER, RETARD CODING
			destination.anim_sprite.set_frame(2)
