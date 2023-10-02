extends Area2D


var HP = 100


func _process(_delta):
	$"../Label".set_text(str(HP))

func hit():
	HP = HP - GlobalStats.ATK
	if HP == 0 or HP < 0:
		$"..".queue_free()
