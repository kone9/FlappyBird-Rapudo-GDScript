extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var datosGlobales
var movimiento : float = 0
var finalSuelo2 : Position3D

# Called when the node enters the scene tree for the first time.
func _ready():
	datosGlobales = get_tree().get_nodes_in_group("Escena_principañ")[0]
	finalSuelo2 = get_tree().get_nodes_in_group("FinalSuelo2")[0] as Position3D
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if datosGlobales.gameOver == false:
		move_and_collide(Vector3(0,0,datosGlobales.dificultad))
		reposicionar()
	else:
		move_and_collide(Vector3(0,0,0))
	

func reposicionar():
	if translation.z > 60:
		translation = finalSuelo2.global_transform.origin
