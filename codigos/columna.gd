extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var datosGlobales
var posicionALeatoria : float

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	datosGlobales = get_tree().get_nodes_in_group("Escena_principañ")[0]
	translation = Vector3(
		self.translation.x,
		rand_range(5,10),
		self.translation.z
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if datosGlobales.gameOver == false:
		move_and_collide(Vector3(0,0,datosGlobales.dificultad))
	reposicionarColumna()
	

func reposicionarColumna():
	if translation.z > 20:
		translation = Vector3(
			self.translation.x,
			rand_range(5,10),
			-20
		)
	