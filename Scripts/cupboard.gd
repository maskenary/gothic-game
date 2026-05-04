extends Area2D

signal player_entered_cupboard(cupboard: Area2D)
@onready var anim_sprite = $AnimatedSprite2D
@onready var player = get_tree().get_first_node_in_group("player")
var contains_player = false
var active = false

func _on_body_entered(body: Node2D) -> void:
	active = true
	if body is Player:
		anim_sprite.play("open")
		
		
func _on_body_exited(body: Node2D) -> void:
	active = false
	if body is Player:
		anim_sprite.play_backwards("open")
		

func _process(delta: float) -> void:
	if Input.is_action_just_released("ui_accept") && active:
		if contains_player == true:
			player.enable()
			contains_player = false
		else:
			player.disable()
			player.global_position = global_position
			player.global_position.y += 20 # ADJUSTMENT, CHANGE THIS LATER, RETARD CODING
			contains_player = true
			anim_sprite.play_backwards("open")
			
			player_entered_cupboard.emit(self)
		
		
