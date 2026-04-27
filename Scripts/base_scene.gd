extends Node

@onready var player = $Player
@onready var entrance_markers = $EntranceMarkers

func _ready():
	if SceneManager.player: 
		if player: # Get rid of scene's player if we already have one
			player.queue_free()
		
		player = SceneManager.player
		add_child(player)
		print("creating player")
	
	position_player()
	
func position_player():
	var last_scene_name = SceneManager.last_scene_name
	if last_scene_name.is_empty():
		last_scene_name = "any"
	for marker in entrance_markers.get_children():
		if marker.name == "any" or marker.name == last_scene_name:
			player.global_position = marker.global_position
