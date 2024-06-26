class_name EnemyMovement
extends CharacterBody2D

@export var movement_speed: float = 100

@export var movement_target: Node2D
@export var navigation_agent: NavigationAgent2D

func _ready():
	navigation_agent.path_desired_distance = 30
	navigation_agent.target_desired_distance = 30
	
	call_deferred("actor_setup")
	
func actor_setup():
	await get_tree().physics_frame
	
func set_movement_target(target: Vector2):
	navigation_agent.target_position = target
	
func _physics_process(_delta):
	set_movement_target(movement_target.position)
	
	if navigation_agent.is_navigation_finished():
		return
		
	var current_agent_position: Vector2 = global_position
	var next_path_positon: Vector2 = navigation_agent.get_next_path_position()
	
	var new_velocity: Vector2 = next_path_positon - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed
	
	velocity = new_velocity
	
	move_and_slide()
