extends Area2D


var HP = 100

func _ready():
	$"../HpBar".set_value(HP)


func hit():
	HP = HP - GlobalStats.ATK
	$"../HpBar".set_value(HP)
	if HP == 0 or HP < 0:
		$"..".queue_free()
