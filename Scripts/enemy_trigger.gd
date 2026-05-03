extends Area2D

signal start_enemy_event

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		start_enemy_event.emit()
		
