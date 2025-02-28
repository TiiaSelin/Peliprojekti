extends Control

@onready var clickSound = $clickSound



func _ready() -> void:
	$GridContainer/quit.connect("mouse_entered", _on_button_hover)


func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_newgame_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	
func _on_button_hover() -> void:
	clickSound.play()

func end_game():
	get_tree().paused = true
