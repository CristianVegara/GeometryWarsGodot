using Godot;
using Microsoft.VisualBasic;
using System;

public partial class Projectile : RigidBody2D
{
	public Enum Type { get; } = Enums.Projectile;

	Vector2 targetDirection;
	float speed = 600.0f;
	
	public override void _Ready()
	{
		// Get mouse position in screen and sets it as target
		targetDirection = GetGlobalMousePosition();
		LookAt(targetDirection);

		// Calculate the direction vector towards the target
		Vector2 direction = (targetDirection - Position).Normalized();

		// Calculate the velocity by multiplying the direction vector by the speed
		LinearVelocity = direction * speed;
		
		
	}
	
	// Destroy projectile on collision
	void _on_body_entered()
	{
		QueueFree();
	}

	// Destroy projectile on timeout
	void _on_timer_timeout()
	{
		QueueFree();
	}
}