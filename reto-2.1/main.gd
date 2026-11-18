extends Node2D

@onready var hud: Label = $Hud

var cuadros_pulsados := 0
var eventos_recibidos := 0

var cuadros_izquierda := 0
var eventos_izquierda := 0

var cuadros_arriba := 0
var eventos_arriba := 0

var cuadros_abajo := 0
var eventos_abajo := 0

var ultima_clase := "Sin eventos"
var dispositivo := "Teclado"
var tipo_senal := "Digital"
var detalle := ""


func _physics_process(_delta: float) -> void:

	# Sondeo derecha (D)
	if Input.is_action_pressed("move_right"):
		cuadros_pulsados += 1

	# Sondeo izquierda (A)
	if Input.is_action_pressed("move_left"):
		cuadros_izquierda += 1

	# Sondeo arriba (W)
	if Input.is_action_pressed("move_up"):
		cuadros_arriba += 1

	# Sondeo abajo (S)
	if Input.is_action_pressed("move_down"):
		cuadros_abajo += 1

	hud.text = "Jump: %s\nEje: %.2f\nFuerza D: %.2f\nClase: %s\nDispositivo: %s\nSenal: %s\nDetalle: %s\n\nDERECHA (D)\nCuadros: %d | Eventos: %d\n\nIZQUIERDA (A)\nCuadros: %d | Eventos: %d\n\nARRIBA (W)\nCuadros: %d | Eventos: %d\n\nABAJO (S)\nCuadros: %d | Eventos: %d" % [
		Input.is_action_pressed("jump"),
		Input.get_axis("move_left", "move_right"),
		Input.get_action_strength("move_right"),
		ultima_clase, dispositivo, tipo_senal, detalle,
		cuadros_pulsados, eventos_recibidos,
		cuadros_izquierda, eventos_izquierda,
		cuadros_arriba, eventos_arriba,
		cuadros_abajo, eventos_abajo
	]


func _input(event: InputEvent) -> void:

	if event is InputEventKey and event.is_echo():
		return

	# Eventos derecha (D)
	if event.is_action_pressed("move_right"):
		eventos_recibidos += 1

	# Eventos izquierda (A)
	if event.is_action_pressed("move_left"):
		eventos_izquierda += 1

	# Eventos arriba (W)
	if event.is_action_pressed("move_up"):
		eventos_arriba += 1

	# Eventos abajo (S)
	if event.is_action_pressed("move_down"):
		eventos_abajo += 1

	ultima_clase = event.get_class()
	dispositivo = "ID %d" % event.device

	if event is InputEventKey:
		dispositivo = "Teclado (ID %d)" % event.device
		tipo_senal = "Digital"
		detalle = "Tecla"

	elif event is InputEventMouseButton:
		dispositivo = "Raton (ID %d)" % event.device
		tipo_senal = "Digital"

		if event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			detalle = "Rueda"
		else:
			detalle = "Clic"

	elif event is InputEventMouseMotion:
		dispositivo = "Raton (ID %d)" % event.device
		tipo_senal = "Posicion"
		detalle = "Movimiento"

	elif event is InputEventJoypadMotion:
		dispositivo = "Mando (ID %d)" % event.device
		tipo_senal = "Analogica"
		detalle = "Palanca"

	elif event is InputEventJoypadButton:
		dispositivo = "Mando (ID %d)" % event.device
		tipo_senal = "Digital"
		detalle = "Boton"

	else:
		tipo_senal = "Posicion"
		detalle = "Otro evento"
