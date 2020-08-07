extends Area2D


func _on_spike_body_entered(body):
	if "player" in body.name:
		body.die()
