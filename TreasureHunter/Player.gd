extends CharacterBody3D

@onready var camera_pivot = $CameraPivot

var SPEED = 5.0
var JUMP_FORCE = 4.5

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= 9.8 * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_FORCE
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if input_dir.length() > 0:
		var forward = camera_pivot.global_transform.basis.z  
		var right = camera_pivot.global_transform.basis.x  

		var move_dir = (right * input_dir.x + forward * input_dir.y).normalized()

		velocity.x = move_dir.x * SPEED
		velocity.z = move_dir.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
