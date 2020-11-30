extends KinematicBody


var datosGlobales

# Called when the node enters the scene tree for the first time.
func _ready():
	datosGlobales = get_tree().get_nodes_in_group("Escena_principañ")[0]
	# finalSuelo1 = get_tree().get_nodes_in_group("FinalSuelo1")[0] as Position3D
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if datosGlobales.gameOver == false:
		move_and_collide(Vector3(0,0,datosGlobales.dificultad))
	else:
		move_and_collide(Vector3(0,0,0))