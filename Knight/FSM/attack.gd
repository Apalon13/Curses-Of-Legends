extends StatePlayer

func enter(_msg: Dictionary={}):
	$"../../DebugData/Debug/State".set_text(name)

func inner_physics_process(_delta):
	
	if knight.direction == "top":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_rotation(80)
		knight.zones.set_monitoring(true)
	if knight.direction == "down":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_rotation(-80)
		knight.zones.set_monitoring(true)
	if knight.direction == "left":
		knight.zones.set_scale(Vector2(-1, 1))            
		knight.zones.set_monitoring(true)
		knight.zones.set_rotation(0)
	if knight.direction == "right":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_monitoring(true)
		knight.zones.set_rotation(0)
	if knight.direction == "right_down":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_monitoring(true)
		knight.zones.set_rotation(-43)
	if knight.direction == "right_top":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_monitoring(true)
		knight.zones.set_rotation(43)
	if knight.direction == "left_top":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_monitoring(true)
		knight.zones.set_rotation(123)
	if knight.direction == "left_down":
		knight.zones.set_scale(Vector2(1, 1))
		knight.zones.set_monitoring(true)
		knight.zones.set_rotation(-123)
	
	if Input.is_action_pressed("ui_l"):
		knight.velocity.x = -1 * knight.BASE_SPEED
	if Input.is_action_pressed("ui_r"):
		knight.velocity.x = 1 * knight.BASE_SPEED
	if Input.is_action_pressed("ui_d"):
		knight.velocity.y = 1 * knight.BASE_SPEED
	if Input.is_action_pressed("ui_u"):
		knight.velocity.y = -1 * knight.BASE_SPEED
	
	knight.velocity.x = move_toward(knight.velocity.x, 0, knight.BASE_SPEED/10)
	knight.velocity.y = move_toward(knight.velocity.y, 0, knight.BASE_SPEED/10)
	$"../../DebugData/Debug/Speed".set_text(str(knight.velocity.x))
	knight.move_and_slide()
	knight.animation.play("attack_" + knight.direction) 
	
func _on_area_2d_area_entered(area):
	print(area.owner.name)
	if area.has_method("hit"):
		area.hit()
		
func _on_animated_sprite_2d_2_animation_finished():
	knight.zones.set_monitoring(false)
	knight.zones.set_rotation(0)
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")
		knight.zones.set_rotation(0)
	else:
		state_machine.change_to("Idle")
