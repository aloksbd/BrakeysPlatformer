extends KinematicBody2D

const UP = Vector2(0,-1)
const SPEED = 200
const ACCELERATION = 50
const GRAVITY = 7
const JUMP = -200
var motion = Vector2()

var bullet = null
var dash = 0

func _physics_process(delta):
	if dash == 1:
		motion = move_and_slide(motion,UP)
		return
	motion.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		$AnimationPlayer.play("walk")
		$Sprite.flip_h = true
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		$AnimationPlayer.play("walk")
		$Sprite.flip_h = false
		motion.x = -SPEED
	else:
		$AnimationPlayer.play("idle")
		motion.x = 0
		
	if is_on_floor():
		dash = 0
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP	
		motion.x = lerp(motion.x,0,0.2)
	else:
		if Input.is_action_just_pressed("dash") && dash == 0:
			dash = 1
			motion.x = -800
			if $Sprite.flip_h:
				motion.x = 800
			motion.y = 0
			yield(get_tree().create_timer(0.2),"timeout")
			dash = 2
		motion.x = lerp(motion.x,0,0.05)
	motion = move_and_slide(motion,UP)
	
func _process(delta):
	
	if Input.is_action_pressed("catch"):
		if bullet != null:
			print("caught")
			if bullet.mainBoss != null:
				bullet.mainBoss.hit()
			bullet.queue_free()
	
func addBullet(_bullet):
	bullet = _bullet
	
func removeBullet():
	bullet = null
	
func die():
	print("dead")
