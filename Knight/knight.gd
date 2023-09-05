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
	
	ray_cast.target_position = get_local_mouse_position()	
	
	direction = (cursor_position - character_position).normalized()
	$DebugData/Debug/Mouse.set_text(str(cursor_position))
	update_orientation()

func update_orientation():
	# Вычисляем угол между вектором направления и вектором (0, 1)
	var angle = direction.angle_to(Vector2(0, 1))
	print(angle)
	
	var dir_index = int((angle + deg_to_rad(22.5)) / deg_to_rad(45)) % 8
	
	rotation = dir_index * 45
