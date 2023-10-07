extends CharacterBody2D

@onready var HpBar = $HpBar
@export var speed = 100
@export var HP = 100
@export var damage = 10
@export var attack_speed = 1
@onready var attack_colldown_timer = $attack_cooldown
var HitboxDamage = false
var can_take_damage = true
var player_chase = false
var player = null
var attack_ip = false
var attack_cooldown = true

func _ready():
	HpBar.set_visible(true)
	HpBar.maxh(HP)
	HpBar.set_value(HP)

func enemy():
	pass

func attack():
	if attack_ip == true and attack_cooldown == false:
		Global.enemyDamage = damage
		Global.playerTakeDamage = false
		attack_cooldown = true

func _physics_process(_delta):
	attack_colldown_timer.set_wait_time(attack_speed)
	$HpBar.set_value(HP)
	if player_chase == true:
		position += (player.position - position)/speed
		move_and_slide()
		$AnimatedSprite2D.play("slime_walk")
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("slime_idle")
	
	deal_with_damage()
	attack()

func deal_with_damage():
	if Global.playerAttackStatus == true and HitboxDamage == true:
		if can_take_damage == true:
			HP = HP - Global.playerDamage
			$ake_damage_cooldown.start()
			can_take_damage = false
			if HP <= 0:
				self.queue_free()

func _on_ake_damage_cooldown_timeout():
	can_take_damage = true
	HitboxDamage = false

func _on_detection_body_entered(body):
	player = body
	player_chase = true

func _on_detection_body_exited(_body):
	player = null
	player_chase = false

func _on_hit_box_damage_area_entered(area):
	if area.has_method("pldamage"):
		HitboxDamage = true

func _on_hit_box_attack_body_entered(body):
	if body.has_method("player"):
		attack_ip = true
		$attack_cooldown.start()
		
func _on_hit_box_attack_body_exited(body):
	if body.has_method("player"):
		attack_ip = false
		attack_cooldown = true

func _on_attack_cooldown_timeout():
	attack_cooldown = false
	Global.playerTakeDamage = true
