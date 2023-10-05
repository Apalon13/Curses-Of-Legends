extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/"+GlobalStats.current_scene+".tscn")
	GlobalStats.finish_changescene()
	
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Scenes/Settings.tscn")

func _on_quit_pressed():
	get_tree().quit()

