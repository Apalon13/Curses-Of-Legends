extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var area_attack = $Area/AttackHitbox
@onready var HpBar = $HpBar
var speed = Global.speedPlayer
var direction = "Down"
var attack_cooldown = false
var damage = Global.playerDamage
var attack_ip = false
var hp = 1
var player_alive = true	

func _ready():
	area_attack.set_monitoring(false)
	area_attack.set_monitorable(false)
	$AudioStreamPlayer.set_volume_db(-80)
	hp = Global.playerhp
	HpBar.maxh(hp)
	HpBar.set_value(hp)
	HpBar.set_visible(false)

func attack():
	if Input.is_action_just_pressed("ui_attack"):
		if attack_cooldown == false:
			attack_ip = true
			area_attack.set_monitoring(true)
			area_attack.set_monitorable(true)
			animation.play("attack"+direction)
			attack_cooldown = true
			$attack_cooldown.start()
		else:
			updateAnimation()
			return

func player():
	pass

func updateAnimation():
	if attack_ip == false:
		if velocity.x < 0:
			direction = "Left"
			animation.play("walk"+ direction)
			$AudioStreamPlayer.set_volume_db(0)
		elif velocity.x > 0:
			direction = "Right"
			animation.play("walk"+ direction)
			$AudioStreamPlayer.set_volume_db(0)
		elif velocity.y < 0:
			direction = "Up"
			animation.play("walk"+ direction)
			$AudioStreamPlayer.set_volume_db(0)
		elif velocity.y > 0:
			direction = "Down"
			animation.play("walk"+ direction)
			$AudioStreamPlayer.set_volume_db(0)
		elif velocity == Vector2.ZERO:
			animation.play("idle"+ direction)
			$AudioStreamPlayer.set_volume_db(-80)

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
func _physics_process(_delta):
	Global.playerposx = position.x
	Global.playerposy = position.y
	
	if hp != Global.playerhp:
		$HpBar.set_visible(true)
		HpBar.set_value(hp)
	else:
		$HpBar.set_visible(false)
		HpBar.set_value(hp)
		
	if hp <= 0:
		player_alive = false
		self.queue_free()
		
	handleInput()
	move_and_slide()
	updateAnimation()
	attack()

func _on_attack_cooldown_timeout():
	attack_cooldown = false
	attack_ip = false
	area_attack.set_monitoring(false)
	area_attack.set_monitorable(false)

func _on_attack_hitbox_area_entered(area):
	if area.has_method("enemy"):
		Global.playerAttackStatus = true
