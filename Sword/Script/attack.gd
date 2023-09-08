extends StateSword

var direction3 = Input.get_axis("ui_l", "ui_r")

func enter(_msg: Dictionary={}):
	pass

func inner_physics_process(_delta):
	pass

func _on_animated_sprite_2d_animation_finished():
	if Input.is_action_just_pressed("ui_attack"):
		state_sword_machine.change_to("Attack")
	else:
		state_sword_machine.change_to("Idle")
