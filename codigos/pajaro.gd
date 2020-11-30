extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var fuerzaImpuelso : float = 5
export var fuerzaImpulsoAlMorir: float = -10
var datosGlobales
var _ButtonReiniciar : TextureButton
var itemSound :AudioStreamPlayer
var musicAUDIO :AudioStreamPlayer
var morirSound :AudioStreamPlayer
var aplicarImpulsoFinal : bool = false
var detectarColisionUnaVes : bool = false

# Called when the node enters the scene tree for the first time.
func _ready()  -> void:
	datosGlobales = get_tree().get_nodes_in_group("Escena_principañ")[0]
	_ButtonReiniciar = get_tree().get_nodes_in_group("ButtonReiniciar")[0]
	itemSound = get_tree().get_nodes_in_group("itemSound")[0]
	morirSound = get_tree().get_nodes_in_group("MorirSound")[0] 
	musicAUDIO = get_tree().get_nodes_in_group("musicAUDIO")[0]

func _physics_process(delta) -> void:
	if datosGlobales.gameOver == false:
		if Input.is_action_just_pressed("click"):
			linear_velocity = Vector3(0,0,0)
			apply_impulse(self.translation,Vector3(0,fuerzaImpuelso,0))
	
	if datosGlobales.gameOver :
		#linear_velocity = Vector3(0,0,0)
		if aplicarImpulsoFinal == false:
			apply_impulse(self.translation,Vector3(0,fuerzaImpulsoAlMorir,0))
			aplicarImpulsoFinal = true

			# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_pajaro_body_entered(body) -> void:
	if detectarColisionUnaVes == false:
		print("colisiono con algo")
		if body.is_in_group("columnas") or body.is_in_group("suelos"):
			print("colisiono con algo")
			musicAUDIO.stop()
			morirSound.play()
			datosGlobales.gameOver = true
			yield(get_tree().create_timer(0.5), "timeout")
			_ButtonReiniciar.visible = true
			_ButtonReiniciar.disabled = false
			detectarColisionUnaVes = true
		
func _on_Area_area_entered(area : Area) -> void:
	itemSound.play()
