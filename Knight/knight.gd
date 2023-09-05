class_name Knight
extends CharacterBody2D

const SPEED = 300.0
const HP = 100.0
var direction = Vector2.ZERO

@onready var animation = $AnimatedSprite2D2
@onready var debug = true
@onready var ray_cast = $RayCast2D

func _process(_delta):

	var character_position = global_position
	var cursor_position = get_global_mouse_position()
	print(character_position, cursor_position)
	var relative_position = cursor_position - character_position
	var angle = rad_to_deg(atan2(relative_position.y, relative_position.x))

	update_orientation(angle)

func update_orientation(angle):
	# Вычисляем угол между вектором направления и вектором (0, 1)
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

	animation.play("run_" + directions[direction_coefficient])
