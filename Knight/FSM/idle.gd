extends StatePlayer

func enter(_msg: Dictionary={}):
	knight.velocity = Vector2.ZERO
	$"../../Camera2D/DebugData/Debug/State".set_text(name)
	

func inner_physics_process(_delta):
		
	
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")
	
	if Input.is_action_pressed("ui_d") or Input.is_action_pressed("ui_u") or Input.is_action_pressed("ui_l") or Input.is_action_pressed("ui_r"):
		state_machine.change_to("Run")

	knight.animation.play("idle_" + knight.direction)

	debug()

func debug():
	
	if knight.debug == false:
		$"../../DebugData/Debug/State".set_visible(false)
		$"../../Camera2D/DebugData/Debug/Direction".set_visible(false)
		$"../../Camera2D/DebugData/Debug/Direction2".set_visible(false)
		$"../../Camera2D/DebugData/Debug/Speed".set_visible(false)
	else:
		$"../../Camera2D/DebugData/Debug/State".set_visible(true)
		$"../../Camera2D/DebugData/Debug/Direction".set_visible(true)
		$"../../Camera2D/DebugData/Debug/Direction2".set_visible(true)
		$"../../Camera2D/DebugData/Debug/Speed".set_visible(true)
