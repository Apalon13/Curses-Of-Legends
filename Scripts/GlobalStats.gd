extends Node
var MS: float  = 100
var ATK: float  = 40.0
var ATK_Speed: float = 10.0
var HP: float  = 100.0
var dialoguestatus = false
var player_current_attack = false
var current_scene = "base_hub" 
var transition_scene = false
var player_exid_cliffside_posx = 14
var player_exid_cliffside_posy = 794
var player_exid_dungeon_posx = 740
var player_exid_dungeon_posy = 15
var player_start_posx = 713
var player_start_posy = 797
var game_first_loadin = true
var regen = 1

func finish_changescene():
	if transition_scene == true:
		transition_scene = false
		if current_scene == "cliff_side":
			current_scene = "base_hub"
			if  game_first_loadin == false:
				player_start_posx = player_exid_cliffside_posx
				player_start_posy = player_exid_cliffside_posy
		if current_scene == "dungeon_scene":
			current_scene = "base_hub"
			if  game_first_loadin == false:
				player_start_posx = player_exid_dungeon_posx
				player_start_posy = player_exid_dungeon_posy
			
			
