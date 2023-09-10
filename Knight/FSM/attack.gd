extends StatePlayer

var direction3 = Input.get_axis("ui_l", "ui_r")

func enter(_msg: Dictionary={}):
	$"../../DebugData/Debug/State".set_text(name)

func inner_physics_process(_delta):
	
	knight.velocity.x = move_toward(knight.velocity.x, 0, knight.SPEED/10)
	knight.move_and_slide()

func _on_animated_sprite_2d_2_animation_finished():
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")
	if Input.is_action_pressed("ui_d") or Input.is_action_pressed("ui_u") or Input.is_action_pressed("ui_l") or Input.is_action_pressed("ui_r"):
		state_machine.change_to("Run")
		
	state_machine.change_to("Idle")