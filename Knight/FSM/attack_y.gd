extends StatePlayer


func enter(_msg: Dictionary={}):
	$"../../Debug/State".set_text(name)

func inner_physics_process(_delta):
	var direction = Input.get_axis("ui_l", "ui_r")
	
	var direction2 = Input.get_axis("ui_u", "ui_d")

	if Input.is_action_just_pressed("ui_attack") and direction2 == -1 and direction == 0:
		$"../../AnimatedSprite2D".set_visible(false)
		$"../../AnimatedSprite2D2".set_visible(true)
		knight.animetionrun.play("attack_top")
	
func _on_animated_sprite_2d_2_animation_finished():
	state_machine.change_to("Idle")
	$"../../AnimatedSprite2D".set_visible(true)
	$"../../AnimatedSprite2D2".set_visible(false)
