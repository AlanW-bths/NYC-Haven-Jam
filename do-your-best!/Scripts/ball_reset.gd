extends RigidBody2D

var original_position: Vector2
var reset_flag := false
func _ready():
	# Store starting position
	original_position = global_position

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if Input.is_action_just_pressed("reset"):
		reset_flag = true
		
func _integrate_forces(state):
	if reset_flag:
		# Move in physics-safe way
		state.transform.origin = original_position
		linear_velocity = Vector2.ZERO
		angular_velocity = 0
		reset_flag = false
