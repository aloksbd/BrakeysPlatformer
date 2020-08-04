extends KinematicBody2D

const UP = Vector2(0,-1)
const SPEED = 100
const ACCELERATION = 25
const GRAVITY = 7
const JUMP = -200
var motion = Vector2()

var bullet = null

func _physics_process(delta):
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, SPEED)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -SPEED)
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP	
		motion.x = lerp(motion.x,0,0.2)
	else:
		motion.x = lerp(motion.x,0,0.05)
	motion = move_and_slide(motion,UP)
	
func _process(delta):
	if Input.is_action_pressed("catch"):
		if bullet != null:
			print("caught")
			bullet.queue_free()
	
func addBullet(_bullet):
	bullet = _bullet
	
func removeBullet():
	bullet = null
