using Godot;
using System;

public class pajaro2 : RigidBody
{
    [Export]
    private float fuerzaImpuelzo = 5;
    private Escena_principañ datosGlobales;
    TextureButton _ButtonReiniciar;
    AudioStreamPlayer itemSound;
    AudioStreamPlayer musicAUDIO;
    AudioStreamPlayer MorirSound;
    bool aplicarImpulsoFinal = false;
    bool detectarColisionUnaVes = false;
    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {
        datosGlobales = (Escena_principañ)GetTree().GetNodesInGroup("Escena_principañ")[0];
        _ButtonReiniciar = (TextureButton)GetTree().GetNodesInGroup("ButtonReiniciar")[0];
        itemSound = (AudioStreamPlayer)GetTree().GetNodesInGroup("itemSound")[0];
        MorirSound = (AudioStreamPlayer)GetTree().GetNodesInGroup("MorirSound")[0];
        musicAUDIO = (AudioStreamPlayer)GetTree().GetNodesInGroup("musicAUDIO")[0];
    }

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
//  public override void _Process(float delta)
//  {
//      
//  }
    public override void _PhysicsProcess(float delta)
    {
        GD.Print(Mathf.Rad2Deg(Rotation.x));
        rotarPajaro();

        if(!datosGlobales.gameOver)//sino es GameOVer
        {
            if(Input.IsActionJustPressed("click"))
            {
                LinearVelocity = new Vector3(0,0,0);
                ApplyImpulse(this.Translation,new Vector3(0,fuerzaImpuelzo,0));
                AngularVelocity = new Vector3(4f,0,0);
            }
        }

        if(datosGlobales.gameOver)
        {
            if(!aplicarImpulsoFinal )//sino aplique impulso al morir
            {
                GD.Print("aplica impulso morir");
                ApplyImpulse(this.Translation,new Vector3(0, -8f, 0));
                aplicarImpulsoFinal = true;
            }
        }
        
    }
    private async void _on_pajaro_body_entered(Node body)
    {
        if(!detectarColisionUnaVes)//sino detecte la colision
        {
            if(body.IsInGroup("columnas") || body.IsInGroup("suelos"))
            {
                GD.Print("reiniciar");
                musicAUDIO.Stop();
                MorirSound.Play();
                datosGlobales.gameOver = true;
                await ToSignal(GetTree().CreateTimer(0.5f), "timeout");
                //LinearVelocity = new Vector3(0,0,0);
                _ButtonReiniciar.Visible = true;
                _ButtonReiniciar.Disabled = false;
                detectarColisionUnaVes = true;
            }
        }

    }
    
    private void _on_Area_area_entered(Area area)
    {
        if(area.IsInGroup("puntos"))
        {
            itemSound.Play();
            GD.Print("tendría que sumar puntos");
        }
    }

    public override void _Input(InputEvent @event)
    {
        //string test = "hola mundo desde javascript";
        if(Input.IsActionJustPressed("click_derecho"))
        {
            JavaScript.Eval("alert('hola desde c#')");
        }
    }

    private void rotarPajaro()
    {
        if(!datosGlobales.gameOver)//sino es GameOVer
        {
            if(LinearVelocity.y > 1)
            {
                AngularVelocity = new Vector3(2.3f,0,0);
            }
            else if(LinearVelocity.y < 1)
            {
                AngularVelocity = new Vector3(-2f,0,0);
            }
            else
            {
                if(Mathf.Rad2Deg(Rotation.x) < 50 || Mathf.Rad2Deg(Rotation.x) > -50)
                {
                    AngularVelocity = new Vector3(0,0,0);
                }
            }
        }
        // else
        // {
        //     AngularVelocity = new Vector3(0,0,0);
        // }
        
        // AngularVelocity = new Vector3(0,0,0);
    }
}
