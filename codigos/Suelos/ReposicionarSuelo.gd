extends Position3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (NodePath) onready var suelo = get_node(suelo) 
var datosGlobales
# Called when the node enters the scene tree for the first time.
func _ready():
	datosGlobales = get_tree().get_nodes_in_group("Escena_principañ")[0]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if datosGlobales.gameOver == false:
		reposicionar()


func reposicionar():
	if suelo.translation.z > 60:
		suelo.translation = self.global_transform.origin
