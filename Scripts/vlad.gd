extends CharacterBody2D


const SPEED = 300.0


func _physics_process(_delta):
	pass

func take_hit():
	$Timer.start()

func _on_timer_timeout():
	$Label.set_text("")
