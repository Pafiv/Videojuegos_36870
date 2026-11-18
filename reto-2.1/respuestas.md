# Respuestas

**1. Mantener D dos segundos:** sube mas el contador de cuadros, porque `_physics_process()` revisa la tecla en 
cada cuadro de fisica (aproximadamente 120 veces a 60 Hz). El de eventos solo cuenta nuevas pulsaciones y no el eco.

**2. Mantener A:** `get_axis()` muestra **-1.00** y `get_action_strength("move_right")` muestra **0.00**. 
El eje combina izquierda y derecha, pero la fuerza de D consulta solo la derecha.

**3. Girar la rueda:** aparece **InputEventMouseButton**. Se comprueba la rueda antes que el clic, 
porque Godot representa la rueda como un boton de raton especial.
