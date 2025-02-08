extends Node3D

@export var rotation_speed: float = 0.1
@export var min_pitch: float = -30
@export var max_pitch: float = 45

var yaw: float = 0
var pitch: float = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 

func _input(event):
	if event is InputEventMouseMotion:
		yaw -= event.relative.x * rotation_speed * 0.1
		pitch -= event.relative.y * rotation_speed * 0.1
		pitch = clamp(pitch, deg_to_rad(min_pitch), deg_to_rad(max_pitch))

func _process(delta):
	rotation_degrees.y = rad_to_deg(yaw)
	rotation_degrees.x = rad_to_deg(pitch)
