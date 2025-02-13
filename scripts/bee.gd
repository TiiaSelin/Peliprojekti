extends CharacterBody2D

@onready var player = get_node("/root/Game/Player")
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var health = 1

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	
	# Määritellään vihollisten nopeus sekä orientoituminen.
	if (direction[0] < 0):
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	velocity = direction * 300.0
	move_and_slide()

func take_damage():
	health -= 1
	
	if health == 0:
		queue_free()
