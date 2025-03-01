extends Control

@onready var clickSound = $clickSound
@onready var gameWinSound = $gameWinSound

func _ready() -> void:
	$GridContainer/quit.connect("mouse_entered", _on_button_hover)
	$GridContainer/newgame.connect("mouse_entered", _on_button_hover)
	connect("visibility_changed", Callable(self, "_on_visibility_changed"))

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_button_hover() -> void:
	clickSound.play()

func end_game():
	get_tree().paused = true

func _on_visibility_changed() -> void:
	if visible:
		playGameWinSound()

func playGameWinSound():
	gameWinSound.play()
