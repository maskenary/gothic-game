extends Node

@onready var timer_label = $CanvasLayer/UI/Panel/TimerLabel
@onready var enemy_event_timer = $EnemyEventTimer

func _ready() -> void:
	var enemy_triggers = get_tree().get_nodes_in_group("enemy_triggers")
	for trigger in enemy_triggers:
		trigger.start_enemy_event.connect(start_enemy_event)

func start_enemy_event():
	enemy_event_timer.start()

func _process(delta: float) -> void:
	timer_label.set_text(str(enemy_event_timer.get_time_left()).pad_decimals(1))
