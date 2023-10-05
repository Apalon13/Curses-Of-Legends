extends Node

var MS: float  = 100
var ATK: float  = 40.0
var HP_st : float = 100.0
var HP: float  = 100.0
var dialoguestatus = false
var player_current_attack = false
var current_scene = "base_hub"
var player_exid_cliffside_posx = 14
var player_exid_cliffside_posy = 794
var player_exid_dungeon_posx = 740
var player_exid_dungeon_posy = 15
var clif = false
var dun = false
var player_start_posx = 713
var player_start_posy = 797
var fp = true
var regen = 1
var silence = false
var posx = 0
var posy = 0
var save_p = "user://savegame.save"
var pos_dict = {}
var current_scene2 = "base_hub"
var pos = Vector2(0,0)

func _ready():
	HP = HP_st

func save():
	var save_data = {
		"username" : "Player",
		"loadPlayerpos" : pos_dict,
		"loadScene" : current_scene,
		"loadHP" : HP
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
		for i in node_data["loadScene"]:
			current_scene2 = node_data["loadScene"]
		for i in node_data["loadPlayerpos"]:
			pos = Vector2(node_data["loadPlayerpos"][i][0],node_data["loadPlayerpos"][i][1])
		print("Game Loaded")

func save_game():
	var file = FileAccess.open_encrypted_with_pass(save_p, FileAccess.WRITE, "Player")
	var json_string = JSON.stringify(save())
	file.store_line(json_string)

func finish_changescene():
	pass
