extends Node

var speedPlayer = 100
var playerAttackStatus = false
var playerDamage = 30
var playerhp = 100
var playerposx = 0
var playerposy = 0
var pos_dict = {}
var save_p = "user://savegame.save"
var pos = Vector2(0,0)
var current_scene = ""
var playerTakeDamage = false
var enemyDamage = 0

func save():
	var save_data = {
		"username" : "Player",
		"loadScene" : current_scene,
		"loadPlayerpos" : pos_dict
	}
	return save_data

func load_game():
	if not FileAccess.file_exists(save_p):
		print("error load")
	var file = FileAccess.open_encrypted_with_pass(save_p, FileAccess.READ, "Player")
	while file.get_position() < file.get_length():
		var json_string = file.get_line()
		var json = JSON.new()
		var _parse_result = json.parse(json_string)
		var node_data = json.get_data()
		print(str(node_data))
		for i in node_data["loadScene"]:
			current_scene = node_data["loadScene"]
		for i in node_data["loadPlayerpos"]:
			pos = Vector2(node_data["loadPlayerpos"][i][0],node_data["loadPlayerpos"][i][1])
		print("Game Loaded")

func save_game():
	var file = FileAccess.open_encrypted_with_pass(save_p, FileAccess.WRITE, "Player")
	var json_string = JSON.stringify(save())
	file.store_line(json_string)
