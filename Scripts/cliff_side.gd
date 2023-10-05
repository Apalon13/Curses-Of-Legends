extends Node2D

func _ready():
	if  GlobalStats.clif == true:
		print("2")
		$player.position.x = 148
		$player.position.y = 248
		GlobalStats.clif = false
	else:
		print("4")
		$player.position = GlobalStats.pos

func  _process(_delta):
	change_scene()

func  change_scene():
	if GlobalStats.current_scene == "base_hub":
		get_tree().change_scene_to_file("res://Scenes/base_hub.tscn")

func _on_cliffside_exidpoint_body_entered(body):
	if body.has_method("player"):
		GlobalStats.clif = true
		print(str(GlobalStats.clif))
		GlobalStats.current_scene = "base_hub"

