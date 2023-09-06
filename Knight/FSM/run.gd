extends StatePlayer

func enter(_msg: Dictionary={}):
	$"../../DebugData/Debug/State".set_text(name)

func inner_physics_process(_delta):
	
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")

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
		
#	if direction == 1 and direction2 == 0:
#		knight.animation.play("run")
#
#	if direction == -1 and direction2 == 0:
#		knight.animation.play("run_back")
#
#	if direction2 == 1 and direction == 0:
#		knight.animation.play("run_top")
#
#	if direction2 == -1 and direction == 0:
#		knight.animation.play("run_down")
#
#	if direction2 == -1 and direction == 1:
#		knight.animation.play("run_bot_down")
#
#	if direction2 == 1 and direction == -1:
#		knight.animation.play("run_top_top")
#
#	if direction2 == -1 and direction == -1:
#		knight.animation.play("run_top_down")
#
#	if direction2 == 1 and direction == 1:
#		knight.animation.play("run_top_bot")
