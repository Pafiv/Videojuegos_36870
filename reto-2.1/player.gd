extends Node2D

@export var velocidad: float = 300.0

func _physics_process(delta: float) -> void:

	# Movimiento horizontal (A y D)
	var direccion_x = Input.get_axis("move_left", "move_right")

	# Movimiento vertical (W y S)
	var direccion_y = Input.get_axis("move_up", "move_down")

	position.x += direccion_x * velocidad * delta
	position.y += direccion_y * velocidad * delta
