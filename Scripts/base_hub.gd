extends Node2D
var cur = false
var dun = false

func _ready():
	if GlobalStats.fp == true:
		print("1")
		$player.position = Vector2(745,792)
		GlobalStats.fp = false
	elif  GlobalStats.clif == true:
		print("2")
		$player.position.x = GlobalStats.player_exid_cliffside_posx
		$player.position.y = GlobalStats.player_exid_cliffside_posy
		GlobalStats.clif = false
	elif  GlobalStats.dun == true:
		print("3")
		$player.position.x = GlobalStats.player_exid_dungeon_posx
		$player.position.y = GlobalStats.player_exid_dungeon_posy	
		GlobalStats.dun = false
	else:
		print("4")
		$player.position = GlobalStats.pos

func  _process(_delta):
	change_scene_dungeon()
	change_scene_cliff()

func change_scene_dungeon():
	if GlobalStats.current_scene == "dungeon_scene":
		get_tree().change_scene_to_file("res://Scenes/dungeon_scene.tscn")
		GlobalStats.current_scene = "dungeon_scene"
			
func  change_scene_cliff():
	if GlobalStats.current_scene == "cliff_side":
		get_tree().change_scene_to_file("res://Scenes/cliff_side.tscn")
		GlobalStats.current_scene = "cliff_side"

func _on_dungeon_scene_body_entered(body):
	if body.has_method("player"):
		GlobalStats.current_scene = "dungeon_scene"
		GlobalStats.dun = true

func _on_cliff_side_body_entered(body):
	if body.has_method("player"):
		GlobalStats.current_scene = "cliff_side"
		GlobalStats.clif = true


