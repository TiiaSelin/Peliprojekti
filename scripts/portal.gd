extends Area2D


const FILE_PATH = "res://scenes/level_"

func _on_body_entered(body: Node2D) -> void:
	# Tämä koodi automatisoi siirtymisen seuraavaan kenttään, jos tasot ovat nimetty level_1.tscn, level_2.tscn jne.
	
	var current_scene = get_tree().current_scene.scene_file_path
	var next_level_num = current_scene.to_int() + 1
	var next_level_path = FILE_PATH + str(next_level_num) + ".tscn"
	
	
	
	get_tree().call_deferred("change_scene_to_file", next_level_path)
