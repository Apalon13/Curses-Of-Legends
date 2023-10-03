extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var HP = GlobalStats.HP
var speed = GlobalStats.MS
var player_alive = true
var current_dir = "none"
var attack_ip = false
@onready var actionable_finder: Area2D = $ActionableFinder
@onready var labledia = $Dialog

func _ready():
	labledia.set_visible(false)
	$AnimatedSprite2D.play("front_idle")
	$HpBar.maxv(HP)
	$HpBar.set_value(HP)
	
func _physics_process(delta):
	if GlobalStats.dialoguestatus == true:
		speed = 0
	else:
		speed = GlobalStats.MS
	
	player_movement(delta)
	enemy_attack()
	attack()
	
	if HP <= 0:
		player_alive = false
		self.queue_free()
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func _unhandled_input(_event: InputEvent):
	if Input.is_action_just_pressed("ui_dialog"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			labledia.set_visible(false)
			actionables[0].action()
			return

func player_movement(_delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0 
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0 
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0 
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0 
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false 
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("front_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("front_idle")

	if dir == "down":
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "up":
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("back_idle")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		HP = HP - 20
		$HpBar.set_value(HP)
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(HP)
	
func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func attack():
	var dir = current_dir
	
	if Input.is_action_just_pressed("ui_attack"):
		GlobalStats.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("front_attack")
			$deal_attack_timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("front_attack")
			$deal_attack_timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("side_attack")
			$deal_attack_timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	GlobalStats.player_current_attack = false
	attack_ip = false

func _on_actionable_finder_area_entered(_area):
	labledia.set_visible(true)

func _on_actionable_finder_area_exited(_area):
	labledia.set_visible(false)

func _on_pick_up_area_entered(area):
	if area.owner.has_method("pickup"):
		area.owner.pickup()