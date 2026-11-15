extends CharacterBody2D


var speed = 75.0
var sprint_speed = 150.0
var acceleration = 200.0
var deceleration = 150.0
var jump_velocity = -200.0
var force = 80.0

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
	# Sprint toggle
	var current_max_speed :float = speed
	if Input.is_action_pressed("sprint"):
		current_max_speed = sprint_speed
	#Horizontal movement input
	var direction := Input.get_axis("left", "right")
	if direction:
		#Accelerate
		velocity.x = move_toward(velocity.x, direction * current_max_speed, acceleration * delta)
	else:
		#Decelerate
		velocity.x = move_toward(velocity.x, 0, deceleration * delta)
	if move_and_slide(): # true if collided
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().apply_force(col.get_normal() * -force)
	move_and_slide()
