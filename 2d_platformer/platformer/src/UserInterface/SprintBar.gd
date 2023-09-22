extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	var _player_path: Player = get_node(@"../../Level/Player")
	# warning-ignore:return_value_discarded
	_player_path.connect("sprint_resource_changed", self, "on_changed")

func on_changed(new_value):
	value = new_value
