extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		motion.x = 120
	if Input.is_action_pressed("ui_left"):
		motion.x = -120
	motion = move_and_slide(motion,Vector2.UP)
	
	pass
