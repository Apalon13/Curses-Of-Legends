class_name Knight
extends CharacterBody2D

var MOVEMENT_SPEED_CHARACTER = 400.0
var HP = 100.0
var ATK = 10.0
var ATTACK_SPEED = 1.0

@onready var direction = "right"
@onready var animation = $AnimatedSprite2D2
@onready var debug = true
@onready var zones = $Zones/Attack1
@onready var pickup = $Zones/PickUp
func _process(_delta):

	var character_position = global_position
	var cursor_position = get_global_mouse_position()
	var relative_position = cursor_position - character_position
	var angle = rad_to_deg(atan2(relative_position.y, relative_position.x))

	update_orientation(angle)

func update_orientation(angle):

	var directions = {
		0: "left",
		1: "left_down",
		2: "down",
		3: "right_down",
		4: "right",
		5: "right_top",
		6: "top",
		7: "left_top",
		8: "left"
	} 
	
	var direction_coefficient: int = round((angle * -1 + 180) / 45)
	
	direction = directions[direction_coefficient]
	
func speed(speed):
	MOVEMENT_SPEED_CHARACTER += speed


func _on_pick_up_area_entered(area):
	if area.owner.has_method("pickup"):
		area.owner.pickup()
		print(str(MOVEMENT_SPEED_CHARACTER))
