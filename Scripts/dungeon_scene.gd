extends Node2D

func _ready():
	if  GlobalStats.dun == true:
		print("2")
		$player.position.x = 101
		$player.position.y = 132
		GlobalStats.dun = false
	else:
		print("4")
		$player.position = GlobalStats.pos

func _process(_delta):
	change_scene()

func  change_scene():
	if GlobalStats.current_scene == "base_hub":
		get_tree().change_scene_to_file("res://Scenes/base_hub.tscn")

func _on_dungeon_scene_body_entered(body):
	if body.has_method("player"):
		GlobalStats.current_scene = "base_hub"
		GlobalStats.dun = true

