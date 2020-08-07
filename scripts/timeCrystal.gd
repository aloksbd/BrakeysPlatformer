extends Area2D


func _on_timeCrystal_body_entered(body):
	if "player" in body.name:
		print("crystal collected")
