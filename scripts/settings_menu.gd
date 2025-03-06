extends Control

@onready var clickSound = $clickSound
@onready var back_button: Button = $Background/Back
@onready var previous: Button = $Background/Previous
@onready var next: Button = $Background/Next
@onready var game_diff: Label = $Background/GameDiff


func _ready() -> void:
	$Background/Back.connect("mouse_entered", _on_button_hover)
	game_diff.text = Global.difficulty

# Äänifunktiot
func _on_button_hover() -> void:
		clickSound.play()


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")


func _on_previous_pressed() -> void:
	if (game_diff.text == "MEDIUM"):
		game_diff.text = "EASY"
	elif (game_diff.text == "EASY"):
		game_diff.text = "HARD"
	else:
		game_diff.text = "MEDIUM"
		
	Global.difficulty = game_diff.text


func _on_next_pressed() -> void:
	if (game_diff.text == "MEDIUM"):
		game_diff.text = "HARD"
	elif (game_diff.text == "HARD"):
		game_diff.text = "EASY"
	else:
		game_diff.text = "MEDIUM"

	Global.difficulty = game_diff.text
