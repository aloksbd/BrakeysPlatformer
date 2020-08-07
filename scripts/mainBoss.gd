extends Sprite

var hp = 0
onready var bullet_scene = preload("res://scenes/bullet.tscn")
func _ready():
	$AnimationPlayer.play("revive")
	
func shootBack():
	var bullet = bullet_scene.instance()
	bullet.position = global_position
	bullet.mainBoss = self
	get_parent().add_child(bullet)
	yield(get_tree().create_timer(1.5), "timeout")
	if hp < 100:
		$AnimationPlayer.play("revive")

func hit():
	hp += 20
	$ColorRect/ColorRect.rect_size.x += 5
	if hp == 100:
		$AnimationPlayer.play("jump")
