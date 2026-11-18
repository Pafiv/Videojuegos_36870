# Reto 2.1 - Panel de controles

Proyecto simple basado en `ejercicio-2`: se usan `_physics_process()` para el sondeo y `_input()` para eventos.

**Abrir:** importar `project.godot` en Godot 4.7.2, abrir `main.tscn` y pulsar F6.

**Controles:** A = izquierda, D = derecha, Space = jump. El personaje es solo la imagen `icon.svg` de Godot.

**Nodos:** `Main (Node2D)` contiene `Hud (Label)` en (40, 40) y `Player` (instancia de `player_base.tscn`) en (576, 500). `Player` contiene un solo `Sprite2D`.

**Velocidad:** seleccionar el nodo `Player` y cambiar `velocidad` en el Inspector.

**Comprobacion:** mantener D y mirar ambos contadores; pulsar A para eje -1.00; girar la rueda y hacer clic para ver la diferencia.

**GitHub (parte de la rubrica):** colocar la carpeta `reto-2.1` en el repositorio y ejecutar:

git del repositorio https://github.com/Pafiv/Videojuegos_36870.git


La publicacion en GitHub debe hacerse desde tu cuenta. No se ha ejecutado Godot en este entorno.
