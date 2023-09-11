extends StatePlayer

func enter(_msg: Dictionary={}):
	$"../../DebugData/Debug/State".set_text(name)

func inner_physics_process(_delta):
	
	knight.zones.set_scale(Vector2(1, 1))
	knight.zones.set_monitoring(true)
	knight.zones.set_rotation(0)
	
	knight.animation.play("attack_right") 

func _on_area_2d_area_entered(area):
	print(area.owner.name)
	if area.has_method("hit"):
		area.hit()


func _on_animated_sprite_2d_2_animation_finished():
	knight.zones.set_monitoring(false)
	knight.zones.set_scale(Vector2(1, 1))
	knight.zones.set_rotation(0)
	if Input.is_action_just_pressed("ui_attack"):
		state_machine.change_to("Attack")
		knight.zones.set_rotation(0)
	else:
		state_machine.change_to("Idle")
