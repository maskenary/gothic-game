extends Area2D

signal start_enemy_event
var enabled = true

func _on_body_entered(body: Node2D) -> void:
	if enabled and body is Player:
		start_enemy_event.emit()
	queue_free()
