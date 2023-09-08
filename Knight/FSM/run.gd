extends StatePlayer

func enter(_msg: Dictionary={}):
	$"../../DebugData/Debug/State".set_text(name)

func inner_physics_process(_delta):

	var direction = Input.get_axis("ui_l", "ui_r")

	$"../../DebugData/Debug/Direction".set_text(str(direction))
	if direction:
		knight.velocity.x = direction * knight.SPEED
	else:
		knight.velocity.x = move_toward(knight.velocity.x, 0, knight.SPEED/10)

	var direction2 = Input.get_axis("ui_d", "ui_u")

	$"../../DebugData/Debug/Direction2".set_text(str(direction2))
	if direction2:
		knight.velocity.y = -1*(direction2 * knight.SPEED)
	else:
		knight.velocity.y = move_toward(knight.velocity.y, 0, knight.SPEED/4)

	knight.move_and_slide()
	
	if knight.velocity.x == 0 and direction == 0 and knight.velocity.y == 0 and direction2 == 0:
		state_machine.change_to("Idle")
	
	knight.animation.play("run_" + knight.direction) 
