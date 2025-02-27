extends Control

@onready var clickSound = $clickSound

func _ready() -> void:
	$GridContainer/quit.connect("mouse_entered", _on_button_hover)

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_button_hover() -> void:
	clickSound.play()

func end_game():
	get_tree().paused = true
