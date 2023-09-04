extends StatePlayer

func enter(_msg: Dictionary={}):
	knight.velocity = Vector2.ZERO
	$"../../Debug/State".set_text(name)
	

func inner_physics_process(_delta):
	if Input.is_action_pressed("ui_d") or Input.is_action_pressed("ui_u") or Input.is_action_pressed("ui_l") or Input.is_action_pressed("ui_r"):
		state_machine.change_to("Run")
	
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")
	
	if knight.debug == false:
		$"../../Debug/State".set_visible(false)
		$"../../Debug/Direction".set_visible(false)
		$"../../Debug/Direction2".set_visible(false)
	else:
		$"../../Debug/State".set_visible(true)
		$"../../Debug/Direction".set_visible(true)
		$"../../Debug/Direction2".set_visible(true)
		
	knight.animation.play("idle")
