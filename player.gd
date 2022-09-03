extends KinematicBody2D

var motion = Vector2()
var speed = 190
var gravity = 10
export var jump = -200

func _process(delta):
	motion = move_and_slide(motion,Vector2.UP)
	pass
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$AnimatedSprite.flip_h = false
		if is_on_floor():
			$AnimatedSprite.play("ran")
			
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$AnimatedSprite.flip_h = true
		if is_on_floor():
			$AnimatedSprite.play("ran")
	else:
		motion.x = 0
		if is_on_floor():
			$AnimatedSprite.play("idle")
		
	if is_on_floor() == false:
		motion.y += gravity
		
		if motion.y > gravity:
			$AnimatedSprite.play("idle")
		#if motion.y > -gravity:
			#$Sprite.play("jump")
		
	if is_on_floor() == true && Input.is_action_pressed("ui_up") == true:
		motion.y = jump
		$AnimatedSprite.play("jump")
	Void()
	pass
func Void():
	if global_position.y >= 600:
		get_tree().reload_current_scene()
	pass

