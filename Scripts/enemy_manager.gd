extends Node

@onready var player = get_tree().get_first_node_in_group("player")
@onready var cupboards = get_tree().get_nodes_in_group("cupboards")
@export var hiding_timer: Timer
@export var death_timer: Timer
@export var ui: Control
@export var video_player: VideoStreamPlayer

var hiding_time = 5
var death_time = 5
var enemy_event_active = false

func _ready() -> void:
	var enemy_triggers = get_tree().get_nodes_in_group("enemy_triggers")
	for trigger in enemy_triggers:
		trigger.start_enemy_event.connect(start_enemy_event)
	for cupboard in cupboards:
		cupboard.player_entered_cupboard.connect(_on_player_entered_cupboard)
		
func play_video(file_path: String):
	player.can_move = false
	player.can_interact = false
	
	video_player.stream = load(file_path)
	video_player.visible = true
	video_player.play()
	await video_player.finished
	video_player.visible = false
	
	player.can_move = true
	player.can_interact = true

func _on_player_entered_cupboard(cupboard: Area2D):
	if enemy_event_active:
		if hiding_timer.is_stopped() == false: # We still have time
			end_enemy_event()
			play_video("res://Assets/cupboard_scene_no_jump.ogv")
		
		elif hiding_timer.is_stopped() == true: # We ran out of time
			death_timer.stop()
			play_video("res://Assets/cupboard_scene_with_jump.ogv")

func start_enemy_event():
	var enemy_triggers = get_tree().get_nodes_in_group("enemy_triggers")
	for trigger in enemy_triggers:
		trigger.enabled = false
	
	enemy_event_active = true
	hiding_timer.start(hiding_time)

func _process(delta: float) -> void:
	ui.update_hiding_timer_label(hiding_timer.time_left)
	ui.update_death_timer_label(death_timer.time_left)
	
func end_enemy_event():
	var enemy_triggers = get_tree().get_nodes_in_group("enemy_triggers")
	for trigger in enemy_triggers:
		trigger.enabled = true
		
	enemy_event_active = false
	hiding_timer.stop()
	
func _on_hiding_timer_timeout() -> void:
	death_timer.start(death_time)

func _on_death_timer_timeout() -> void:
	play_video("res://Assets/immediate_jump.ogv")
