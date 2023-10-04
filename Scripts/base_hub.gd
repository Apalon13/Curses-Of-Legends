extends Node2D
var cur = false
var dun = false

func _ready():
	$player.position.x = GlobalStats.player_start_posx
	$player.position.y = GlobalStats.player_start_posy
		
func  _process(_delta):
	change_scene_dungeon()
	change_scene_cliff()

func  change_scene_dungeon():
	if GlobalStats.transition_scene == true and dun == true:
		if GlobalStats.current_scene == "base_hub":
			get_tree().change_scene_to_file("res://Scenes/dungeon_scene.tscn")
			GlobalStats.current_scene = "dungeon_scene"
			GlobalStats.game_first_loadin = false
			
func  change_scene_cliff():
	if GlobalStats.transition_scene == true and cur == true:
		if GlobalStats.current_scene == "base_hub":
			get_tree().change_scene_to_file("res://Scenes/cliff_side.tscn")
			GlobalStats.current_scene = "cliff_side"
			GlobalStats.game_first_loadin = false

func _on_dungeon_scene_body_entered(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = true
		dun = true

func _on_dungeon_scene_body_exited(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = false
		dun = false

func _on_cliff_side_body_entered(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = true
		cur = true


func _on_cliff_side_body_exited(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = false
		cur = false

