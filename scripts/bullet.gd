extends Area2D


var speed = -130
var velocity = Vector2()

func _ready():
	yield(get_tree().create_timer(3), "timeout")
	queue_free()
		
func _physics_process(delta):
	velocity.x = speed * delta
	translate(velocity)

func _on_Area2D_body_exited(body):
	body.removeBullet()


func _on_Area2D_body_entered(body):
	body.addBullet(self)
