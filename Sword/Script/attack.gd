extends StateSword

func inner_physics_process(_delta):

	if sword.directionsattacks == "attack":
		sword.zones.set_rotation(-93)
		sword.zones.set_monitoring(true)
	if sword.directionsattacks == "top_attack":
		sword.zones.set_rotation(93)
		sword.zones.set_monitoring(true)
	if sword.directionsattacks == "left_attack":
		sword.zones.set_scale(Vector2(-1, 1))
		sword.zones.set_monitoring(true)
		sword.zones.set_rotation(0)
	if sword.directionsattacks == "right_attack":
		sword.zones.set_scale(Vector2(1, 1))
		sword.zones.set_monitoring(true)
		sword.zones.set_rotation(0)
	
	print(sword.zones.get_rotation())
	sword.animationsword.play("sword_" + sword.directionsattacks)

func _on_animated_sprite_2d_animation_finished():
	sword.zones.set_monitoring(false)
	sword.zones.set_scale(Vector2(1, 1))
	sword.zones.set_rotation(0)
	if Input.is_action_just_pressed("ui_attack"):
		state_sword_machine.change_to("Attack")
		sword.zones.set_rotation(0)
	else:
		state_sword_machine.change_to("Idle")


func _on_attack_1_area_entered(area):
	print(area.owner.name)
	if area.has_method("hit"):
		area.hit()

