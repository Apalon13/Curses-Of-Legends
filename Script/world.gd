extends Node2D



func _ready():
	$Player.position = Global.pos
	Global.current_scene = "World"
