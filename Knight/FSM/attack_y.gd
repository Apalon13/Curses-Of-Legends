extends StatePlayer


func enter(_msg: Dictionary={}):
	$"../../Debug/State".set_text(name)

func inner_physics_process(_delta):
	pass

