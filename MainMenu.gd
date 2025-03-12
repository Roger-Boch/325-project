extends Control

func _ready():
	$VBoxContainer/PlayButton.connect("pressed", self._on_play_pressed)
	$VBoxContainer/QuitButton.connect("pressed", self._on_quit_pressed)

func _on_play_pressed():
	# Replace 'res://Game.tscn' with your actual game scene path
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_quit_pressed():
	get_tree().quit()
