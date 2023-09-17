using Godot;
using System;
using System.Numerics;

public partial class PlayerController : RigidBody2D
{
	private const float SPEED = 500.00f;
	private Godot.Vector2 move = Godot.Vector2.Zero;
	private Godot.Vector2 targetDirection;
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
	public void PlayerMovement(Godot.Vector2 moveDirection, double delta)
	{
		GlobalPosition += moveDirection.Normalized() * SPEED * (float)delta;
	}
	public void FaceMouseDirection(double delta)
	{
		targetDirection = GetGlobalMousePosition();
		LookAt(targetDirection);
	}
	public void Collision(double delta)
	{
		
	}

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{

	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}

	public override void _PhysicsProcess(double delta)
	{
		KeyDetection(delta);
		FaceMouseDirection(delta);
	}
}