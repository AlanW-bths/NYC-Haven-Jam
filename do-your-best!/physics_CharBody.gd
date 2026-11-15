extends Node2D

@export var pushForce = 500
@export var bodyPath: NodePath = "Node2D.Player"
@onready var body: CharacterBody2D = get_node(bodyPath)
var force = 1000

func _physics_process(_delta):
	if $CharacterBody2D.move_and_slide(): # true if collided
		for i in $CharacterBody2D.get_slide_collision_count():
			var col = $CharacterBody2D.get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -force)
