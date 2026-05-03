extends CharacterBody2D
@onready var flash_light: PointLight2D = $flashlight

var targetPosition: Vector2

func _physics_process(delta: float) -> void:
	if targetPosition:
		flash_light.look_at(targetPosition)
