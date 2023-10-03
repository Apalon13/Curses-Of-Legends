extends CharacterBody2D

var speed = 200
var player_chase = false
var player = null
var HP = 50
var player_inattack_zone = false
var can_take_damage = true

func _ready():
	$HpBar.maxv(HP)
	$HpBar.set_value(HP)

func enemy():
	pass

func _physics_process(_delta):
	deal_with_damage()
	
	if player_chase == true:
		position += (player.position - position)/speed

		$AnimatedSprite2D.play("slime")
		
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("slime")

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