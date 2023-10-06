extends CharacterBody2D

@onready var HpBar = $HpBar
@export var speed = 100
@export var HP = 100
var HitboxDamage = false
var can_take_damage = true
var player_chase = false
var player = null

func _ready():
	HpBar.set_visible(true)
	HpBar.maxh(HP)
	HpBar.set_value(HP)

func enemy():
	pass

func _physics_process(_delta):
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

func deal_with_damage():
	if Global.playerAttackStatus == true and HitboxDamage == true:
		if can_take_damage == true:
			HP = HP - Global.playerDamage
			$HpBar.set_value(HP)
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

