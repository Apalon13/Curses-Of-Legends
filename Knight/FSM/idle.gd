extends StatePlayer

func enter(_msg: Dictionary={}):
	knight.velocity = Vector2.ZERO
	

func inner_physics_process(_delta):
	if Input.is_action_pressed("ui_d") or Input.is_action_pressed("ui_u") or Input.is_action_pressed("ui_l") or Input.is_action_pressed("ui_r"):
		state_machine.change_to("Run")

	knight.animation.play("idle_" + knight.direction)
