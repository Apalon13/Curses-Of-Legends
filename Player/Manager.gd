extends Node

@onready var pmenu = $"../CanvasLayer/PlayerMenu"
var game_paused = false
var pos = []

func _process(_delta):
	if Input.is_action_just_pressed("ui_menu"):
		game_paused = !game_paused
	if game_paused == true:
		pmenu.show()
		get_tree().paused = true
	else:
		pmenu.hide()
		get_tree().paused = false

func save():
	pos.append(Global.playerposx)
	pos.append(Global.playerposy)
	Global.pos_dict[name] = pos
	Global.save_game()
	print("Game Saved")
	game_paused = !game_paused

func _on_resume_pressed():
	game_paused = !game_paused

func _on_save_pressed():
	save();

func _on_load_pressed():
	Global.load_game()
	get_tree().change_scene_to_file("res://Scenes/"+Global.current_scene+".tscn")

func _on_quit_pressed():
	get_tree().paused = false
