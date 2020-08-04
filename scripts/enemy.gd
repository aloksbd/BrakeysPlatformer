extends KinematicBody2D

onready var bullet_scene = preload("res://scenes/bullet.tscn")
func _ready():
	$AnimationPlayer.play("revive")
	
func shootBack():
	var bullet = bullet_scene.instance()
	bullet.position = global_position
	get_parent().add_child(bullet)
