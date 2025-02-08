extends Area3D

@export var spin_speed: float = 30.0  

func _ready():
	add_to_group("treasure")
	body_entered.connect(_on_body_entered)

func _process(delta):
	rotation_degrees.y += spin_speed * delta  

func _on_body_entered(body):
	if body.is_in_group("player"):
		get_node("/root/Main").collect_treasure() 
		queue_free()
