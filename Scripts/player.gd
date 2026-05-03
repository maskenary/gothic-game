extends CharacterBody2D

class_name Player

@export var speed = 50
@onready var sprite = $Sprite
var enabled = true

func _process(delta: float) -> void:
	if velocity.x < 0:
		sprite.flip_h = 1
	elif velocity.x > 0:
		sprite.flip_h = 0

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(delta):
	if enabled:
		get_input()
		move_and_slide()

func disable():
	enabled = false
	sprite.hide()

func enable():
	enabled = true
	sprite.show()
