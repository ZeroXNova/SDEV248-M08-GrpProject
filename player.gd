extends CharacterBody2D

@export var speed: float = 180.0
@export var flashlight_hold_offset := Vector2(0, 0)

@onready var flashlight_pivot: Node2D = $FlashlightPivot
@onready var beam_sprite: Sprite2D = $FlashlightPivot/BeamSprite

func _ready() -> void:
	beam_sprite.centered = false
	beam_sprite.position = Vector2.ZERO
	beam_sprite.rotation = 0

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_dir * speed
	move_and_slide()

	flashlight_pivot.position = flashlight_hold_offset

	var angle = (get_global_mouse_position() - flashlight_pivot.global_position).angle()
	flashlight_pivot.rotation = angle
