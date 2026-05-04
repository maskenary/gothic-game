extends Control

@export var hiding_timer_label: Label
@export var death_timer_label: Label

func update_hiding_timer_label(time):
	hiding_timer_label.set_text(str(time).pad_decimals(1))
func update_death_timer_label(time):
	death_timer_label.set_text(str(time).pad_decimals(1))
