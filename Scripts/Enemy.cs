using Godot;
using System;

public partial class Enemy : RigidBody2D
{
	float speed = 300.0f;
	float stoppingDistance = 35;
	Vector2 targetDirection;

	public override void _Ready()
	{
		
	}

	public override void _PhysicsProcess(double delta)
	{
		Vector2 direction = Vector2.Zero;

		targetDirection = GetGlobalMousePosition();

		if (Position.DistanceTo(targetDirection) > stoppingDistance)
		{
			LookAt(targetDirection);

			// Calculate the direction vector towards the target
			direction = (targetDirection - Position).Normalized();
		}

		// Calculate the velocity by multiplying the direction vector by the speed
		LinearVelocity = direction * speed;
	}
}
