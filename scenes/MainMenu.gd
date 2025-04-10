extends CanvasLayer

func _ready():
	$PlayButton.connect("pressed", self._on_play_pressed)
	$QuitButton.connect("pressed", self._on_quit_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quit_pressed():
	get_tree().quit()
