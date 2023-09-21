extends Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", 0.5)
	if dir.length_squared() > 0:
		rotation = dir.angle()
