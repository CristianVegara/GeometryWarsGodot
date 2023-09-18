using Godot;

public partial class PlayerController : RigidBody2D
{
	private const float SPEED = 500.00f;
	private Godot.Vector2 move = Godot.Vector2.Zero;
	private Godot.Vector2 targetDirection;

	private Vector2 projectileSpawnPoint;
	private PackedScene projectileScene;

	#region Override Methods

	public override void _Ready()
	{
		projectileScene = GD.Load<PackedScene>("res://Prefabs/Projectile.tscn");
		projectileSpawnPoint = GetNode<Node2D>("ProjectileSpawnPoint2").GlobalPosition;
	}

	public override void _PhysicsProcess(double delta)
	{
		KeyDetection(delta);
		FaceMouseDirection(delta);
	}

	#endregion

	#region Private Methods

	private void KeyDetection(double delta)
	{
		move = Godot.Vector2.Zero;
		if (Input.IsKeyPressed(Key.W))
		{
			move[1] -= 1;
		}
		if (Input.IsKeyPressed(Key.S))
		{
			move[1] += 1;
		}
		if (Input.IsKeyPressed(Key.A))
		{
			move[0] -= 1;
		}
		if (Input.IsKeyPressed(Key.D))
		{
			move[0] += 1;
		}
		PlayerMovement(move, delta);
	}

	private void PlayerMovement(Godot.Vector2 moveDirection, double delta)
	{
		GlobalPosition += moveDirection.Normalized() * SPEED * (float)delta;
	}
	
	private void FaceMouseDirection(double delta)
	{
		targetDirection = GetGlobalMousePosition();
		LookAt(targetDirection);
	}
	
	#endregion

	#region Nodes

	private void _on_timer_timeout()
	{
		GD.Print(projectileSpawnPoint);
		RigidBody2D newInstance = (RigidBody2D)projectileScene.Instantiate();
		GetParent().AddChild(newInstance);
		newInstance.Position = projectileSpawnPoint;
	}

	private void _on_body_entered(double delta)
	{
		
	}
	
	#endregion
}
