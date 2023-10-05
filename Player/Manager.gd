extends Node
var game_paused = false
@onready var pmenu = $"../CanvasLayer/Menumain"
var pos = []

func _process(_delta):
	if Input.is_action_just_pressed("ui_menu1"):
		game_paused = !game_paused
	if game_paused == true:
		pmenu.show()
		get_tree().paused = true
	else:
		pmenu.hide()
		get_tree().paused = false
	
func save():
	pos.append(GlobalStats.posx)
	pos.append(GlobalStats.posy)
	GlobalStats.pos_dict[name] = pos
	GlobalStats.save_game()
	print("Game Saved")

func _on_resume_pressed():
	game_paused = !game_paused

func _on_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func _on_load_pressed():
	GlobalStats.load_game()
	GlobalStats.current_scene = GlobalStats.current_scene2
	print(str(GlobalStats.current_scene2))
	print(str(GlobalStats.current_scene))
	get_tree().change_scene_to_file("res://Scenes/"+GlobalStats.current_scene2+".tscn")

func _on_save_pressed():
	save()

