extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var escenaPrincipal
var animaciones : AnimationPlayer 
var itemSound : AudioStreamPlayer 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animaciones = get_tree().get_nodes_in_group("AnimationPlayer")[0] as AnimationPlayer
	itemSound = get_tree().get_nodes_in_group("itemSound")[0] as AudioStreamPlayer

	pass # Replace with function body.

func _on_Button_button_down() -> void:
	get_tree().change_scene_to(escenaPrincipal)

func _on_Button_mouse_entered() -> void:
	animaciones.play("animacionBoton")
	itemSound.play()

func _on_Button_mouse_exited() -> void:
	animaciones.play_backwards("animacionBoton")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
