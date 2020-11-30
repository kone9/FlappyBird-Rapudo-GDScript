extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var dificultad : float = 0.01

export var gameOver : bool = false

export var inicioJuego : bool = false

var fps : Label

var selectMenuSound : AudioStreamPlayer
var _animationPlayer : AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fps = get_node("fps") as Label
	_animationPlayer = get_node("AnimationPlayer") as AnimationPlayer
	selectMenuSound = get_node("MusicAndVfx/selectMenuSound") as AudioStreamPlayer


func _physics_process(delta : float) -> void:
	fps.text = "fps= " + str(Engine.get_frames_per_second())

func _on_ButtonReiniciar_button_down()  -> void:
	print("Tendria que reiniciar")
	get_tree().reload_current_scene()


func _on_ButtonReiniciar_mouse_entered()  -> void:
	_animationPlayer.play("agrandarButton")
	selectMenuSound.play()


func _on_ButtonReiniciar_mouse_exited()  -> void:
	_animationPlayer.play_backwards("agrandarButton")

func _on_TimerDificultad_timeout()  -> void:
	if !gameOver:
		dificultad += 0.01;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


# # # [Export]
# # # public float dificultad = 0.01f;
# # # [Export]
# # # public bool gameOver = false;
# # # [Export]
# # # public bool inicioJuego = false;
# # # [Export]
# # # Label fps;
# # # AudioStreamPlayer selectMenuSound;
# # # AnimationPlayer _animationPlayer;
# # # #// Called when the node enters the scene tree for the first time.

# # # public override void _Ready()
# # # {
# # # 	fps = GetNode<Label>("fps");
# # # 	_animationPlayer=GetNode<AnimationPlayer>("AnimationPlayer");
# # # 	selectMenuSound = GetNode<AudioStreamPlayer>("MusicAndVfx/selectMenuSound");
# # # }

# # # // // //  // Called every frame. 'delta' is the elapsed time since the previous frame.
# # # // //     public override void _Process(float delta)
# # # // //     {
			  
# # # // //     }

# # # public override void _PhysicsProcess(float delta)
# # # {
# # # 	fps.Text = "fps= " + Engine.GetFramesPerSecond();
# # # }




# # # private void _on_ButtonReiniciar_button_down()
# # # {
# # # 	GetTree().ReloadCurrentScene();
# # # }

# # # private void _on_ButtonReiniciar_mouse_entered()
# # # {
# # # 	_animationPlayer.Play("agrandarButton");
# # # 	selectMenuSound.Play();
# # # }

# # # private void _on_ButtonReiniciar_mouse_exited()
# # # {
# # # 	_animationPlayer.PlayBackwards("agrandarButton");
# # # }

# # # private void _on_TimerDificultad_timeout()
# # # {
# # # 	if(!gameOver)
# # # 	{
# # # 		dificultad += 0.01f;
# # # 		GD.Print(dificultad);
# # # 	}
# # # }
