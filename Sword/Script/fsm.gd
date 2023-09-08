class_name StateSwordMachine
extends Node

@export var start_state: NodePath

@onready var states: StateS = get_node(start_state) 

func _ready():
	for child in get_children():
		child.state_sword_machine = self
	states.enter()

func _unhandled_input(event):
	states.innner_unhandled_input(event)


func _process(delta):
	states.inner_process(delta)

func _physics_process(delta):
	states.inner_physics_process(delta)

func change_to(target_state: String, msg: Dictionary={}):
	if not has_node(target_state):
		print("error")
		return
	states.exit()
	states = get_node(target_state)
	states.enter(msg)
	print(states.name)
