extends CharacterBody2D

class_name Player

@export var speed = 400
@onready var sprite = $Sprite

func _process(delta: float) -> void:
	if velocity.x < 0:
		sprite.flip_h = 1
	elif velocity.x > 0:
		sprite.flip_h = 0
	

func get_input():
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
