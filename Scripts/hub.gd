extends Node2D

func _ready():
	if GlobalStats.game_first_loadin == true:
		$player.position.x = GlobalStats.player_start_posx
		$player.position.y = GlobalStats.player_start_posy
	else:
		$player.position.x = GlobalStats.player_exid_cliffside_posx
		$player.position.y = GlobalStats.player_exid_cliffside_posy
		
func  _process(_delta):
	change_scene()

func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = true

func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		GlobalStats.transition_scene = false

func  change_scene():
	if GlobalStats.transition_scene == true:
		if GlobalStats.current_scene == "hub":
			get_tree().change_scene_to_file("res://Scenes/cliff_side.tscn")
			GlobalStats.game_first_loadin = false
			GlobalStats.finish_changescene()
