extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("key touched")
	if body.is_in_group("player"):
		body.inventory.append("key")
		queue_free()
