class_name Bots_of_speed
extends Item 

func pickup():
	MOVEMENT_SPEED = 100
	print(name)
	GlobalStats.MS += MOVEMENT_SPEED
	$".".queue_free()
