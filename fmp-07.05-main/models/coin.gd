extends Area3D
signal coinCollected

const ROT_SPEED = 2 # number of degrees the coin rotates every frame.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED))

func _on_body_entered(body):
	emit_signal("coinCollected")
	queue_free()
