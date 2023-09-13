extends Item 

func pickup():
	MOVEMENT_SPEED = 500000
	print(name)
#	K.MOVEMENT_SPEED_CHARACTER = K.MOVEMENT_SPEED_CHARACTER + MOVEMENT_SPEED
	K.speed(MOVEMENT_SPEED)
	$".".queue_free()
