extends StateSword

func enter(_msg: Dictionary={}):
	sword.velocity = Vector2.ZERO
	

func inner_physics_process(_delta):
	if Input.is_action_just_pressed("ui_attack"):
		state_sword_machine.change_to("Attack")

	sword.animationsword.play("sword_" + sword.directions)
	
