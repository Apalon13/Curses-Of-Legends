extends Node2D

func _process(_delta):
	change_scene()

func  change_scene():
	if GlobalStats.transition_scene == true:
		if GlobalStats.current_scene == "dungeon_scene":
			get_tree().change_scene_to_file("res://Scenes/base_hub.tscn")

			GlobalStats.finish_changescene()

func _on_dungeon_scene_body_entered(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = true

func _on_dungeon_scene_body_exited(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = false
