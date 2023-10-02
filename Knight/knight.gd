class_name Knight
extends CharacterBody2D

var MOVEMENT_SPEED_CHARACTER = 0
var HP = 0
var ATK = 0
var ATTACK_SPEED = 0

@onready var direction = "right"
@onready var animation = $AnimatedSprite2D2
@onready var debug = true
@onready var zones = $Zones/Attack1
@onready var pickup = $Zones/PickUp
@onready var actionable_finder: Area2D = $Zones/ActionableFinder
@onready var labledia = $Dialog

func _process(_delta):
	if GlobalStats.dialoguestatus == true:
		MOVEMENT_SPEED_CHARACTER = 0
	else:
		MOVEMENT_SPEED_CHARACTER = GlobalStats.MS
	HP = GlobalStats.HP
	ATK = GlobalStats.ATK
	ATTACK_SPEED = GlobalStats.ATK_Speed
	var character_position = global_position
	var cursor_position = get_global_mouse_position()
	var relative_position = cursor_position - character_position
	var angle = rad_to_deg(atan2(relative_position.y, relative_position.x))

	update_orientation(angle)

func update_orientation(angle):

	var directions = {
		0: "left",
		1: "left_down",
		2: "down",
		3: "right_down",
		4: "right",
		5: "right_top",
		6: "top",
		7: "left_top",
		8: "left"
	} 
	
	var direction_coefficient: int = round((angle * -1 + 180) / 45)
	
	direction = directions[direction_coefficient]


func _on_pick_up_area_entered(area):
	if area.owner.has_method("pickup"):
		area.owner.pickup()


func _unhandled_input(_event: InputEvent):
	if Input.is_action_just_pressed("ui_dialog"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			labledia.set_visible(false)
			actionables[0].action()
			return


func _on_actionable_finder_area_entered(_area):
	labledia.set_visible(true)


func _on_actionable_finder_area_exited(_area):
	labledia.set_visible(false)
