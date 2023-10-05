class_name SaveGame
extends Node2D

func _ready():
	load_game()

func save():
	var save_dict = {
		"cordinatex": GlobalStats.posx,
		"cordinatey": GlobalStats.posy,
		"asdas" : 124
		
	}
	return save_dict

func save_game():
	var save_gamed = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save_gamed.store_line(json_string)
	
func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return
	
	var save_gamed = FileAccess.open("user://savegame.save", FileAccess.READ)

	while save_gamed.get_position() < save_gamed.get_length():
		var json_string = save_gamed.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_date()
		
		
		print(node_data)
