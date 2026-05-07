extends CharacterBody2D

@export var speed = 50
@onready var sprite = $Sprite
var can_move = true
var can_interact = true
var hiding = false
var inventory = []

func _process(delta: float) -> void:
	if velocity.x < 0:
		sprite.flip_h = 1
	elif velocity.x > 0:
		sprite.flip_h = 0

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _physics_process(delta):
	if can_move:
		get_input()
		move_and_slide()

func disable():
	can_move = false
	sprite.hide()

func enable():
	can_move = true
	sprite.show()
