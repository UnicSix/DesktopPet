extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -40.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physic/2d/default_gravity")
var x_border = DisplayServer.window_get_size().x;
var y_border = DisplayServer.window_get_size().y;
var time = 0
var isMoving = false
var droptime_threshold = 5

func _physics_process(delta):
	time += delta
	if time >= 2:
		var direction = Vector2.AXIS_X
		velocity.y = JUMP_VELOCITY
		velocity.x = SPEED
		time = 0
	
	else:
		isMoving = true;
		move_and_slide()

