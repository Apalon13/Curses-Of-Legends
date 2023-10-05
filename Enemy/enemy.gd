extends CharacterBody2D

var speed = 100
var player_chase = false
var player = null
var playeraudio = null
var HP = 0
var HP_start = 50
var player_inattack_zone = false
var can_take_damage = true

func _ready():
	HP = HP_start
	$HpBar.set_visible(false)
	$HpBar.maxv(HP)
	$HpBar.set_value(HP)

func enemy():
	pass
	
func _physics_process(_delta):
	if GlobalStats.silence == true:
		if (GlobalStats.posx - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
			$detection_area.set_scale(Vector2(-1, -1))
		else:
			$AnimatedSprite2D.flip_h = false
			$detection_area.set_scale(Vector2(1, 1))
			
	deal_with_damage()
	if HP != HP_start:
		$HpBar.set_visible(true)
	else:
		$HpBar.set_visible(false)

	if player_chase == true:
		position += (player.position - position)/speed
		move_and_slide()
		$AnimatedSprite2D.play("slime_walk")
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
			$detection_area.set_scale(Vector2(-1, -1))
		else:
			$AnimatedSprite2D.flip_h = false
			$detection_area.set_scale(Vector2(1, 1))
	else:
		$AnimatedSprite2D.play("slime_idle")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false

func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true

func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false

func deal_with_damage():
	if player_inattack_zone and GlobalStats.player_current_attack == true:
		if can_take_damage == true:
			HP = HP - GlobalStats.ATK
			$HpBar.set_value(HP)
			$take_damage_cooldown.start()
			can_take_damage = false
			if HP <= 0:
				self.queue_free()
		
func _on_take_damage_cooldown_timeout():
	can_take_damage = true

func _on_listener_area_entered(area):
	if area.has_method("player"):
		GlobalStats.silence = true

func _on_listener_area_exited(area):
	if area.has_method("player"):
		GlobalStats.silence = false
