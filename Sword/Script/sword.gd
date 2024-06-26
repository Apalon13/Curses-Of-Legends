class_name Sword
extends CharacterBody2D

@onready var animationsword = $AnimatedSprite2D
@onready var directions = "right"
@onready var directionsattacks = "attack"
@onready var zones = $Zones/Attack1



func _process(_delta):

	var sword_position = global_position
	var cursorsword_position = get_global_mouse_position()
	var relativesword_position = cursorsword_position - sword_position
	var anglesword = rad_to_deg(atan2(relativesword_position.y, relativesword_position.x))

	update_orientationsword(anglesword)

func update_orientationsword(anglesword):
	var directionattack = {
		0: "left_attack",
		1: "left_attack",
		2: "left_attack",
		3: "left_attack",
		4: "left_attack",
		5: "left_attack",
		6: "left_attack",
		7: "top_attack",
		8: "top_attack",
		9: "top_attack",
		10: "top_attack",
		11: "top_attack",
		12: "top_attack",
		13: "right_attack",
		14: "right_attack",
		15: "right_attack",
		16: "right_attack",
		17: "attack",
		18: "attack",
		19: "attack",
		20: "attack",
		21: "attack",
		22: "attack",
		23: "attack",
		24: "attack",
		25: "attack",
		26: "attack",
		27: "attack"
	}
	#0 - left 1 - attack 2 - top 3 - left 
	var directionssword = {
		0: "left",
		1: "left_top",
		2: "left_top2",
		3: "left_top3",
		4: "left_top4",
		5: "left_top5",
		6: "left_top6",
		7: "top",
		8: "top_right",
		9: "top_right2",
		10: "top_right3",
		11: "top_right4",
		12: "top_right5",
		13: "top_right6",
		14: "right",
		15: "right_down",
		16: "right_down2",
		17: "right_down3",
		18: "right_down4",
		19: "right_down5",
		20: "right_down6",
		21: "down",
		22: "down_left",
		23: "down_left2",
		24: "down_left3",
		25: "down_left4",
		26: "down_left5",
		27: "down_left6"
	} 
	
	var directionsword_coefficient: int = round((anglesword * 1 + 180) / 13.33)
	var directionattack_coefficient: int = round((anglesword * 1 + 180) / 13.33)

	directions = directionssword[directionsword_coefficient]
	directionsattacks = directionattack[directionattack_coefficient]
