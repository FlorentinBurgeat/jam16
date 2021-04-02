extends PathFollow2D

signal playerspotted
# Declare member variables here. Examples:

enum Direction {
	UP,
	DOWN,
	LEFT,
	RIGHT
}

export var speed = 5
var current_direction = Direction.DOWN

func _physics_process(delta):
	var prepos = get_global_position()
	set_offset(get_offset() + speed + delta)
	var next_direction = get_next_direction(prepos)
	
	if next_direction != current_direction:
		current_direction = next_direction
		set_directional_properties(current_direction)

func get_next_direction(oldpos: Vector2):
	var angle :float = rad2deg((get_global_position() - oldpos).angle())
	if angle >= -135 and angle <= -45:
		return Direction.UP
	if angle < -135 or angle > 135:
		return Direction.LEFT
	if angle >= 45 and angle <=135 :
		return Direction.DOWN
	return Direction.RIGHT

func set_directional_properties(direction: int) -> void:
	match direction:
		Direction.UP:
			set_up()
		Direction.LEFT:
			set_left()
		Direction.DOWN:
			set_down()
		Direction.RIGHT:
			set_right()

func set_up():
	animate("up")
	place_cone(1, -127, 93)
	
func set_left():
	animate("horizontal", true)
	place_cone(-87, 3, 0)

func set_right():
	animate("horizontal", false)
	place_cone(84, 3, -175)
	
func set_down():
	animate("down")
	place_cone(-4, 130, -87)
	
func animate(direction: String, hflip: bool = false) -> void:
	$KinematicBody2D/AnimatedSprite.set_animation(direction)
	$KinematicBody2D/AnimatedSprite.set_flip_h(hflip)
	var y_offset = -10 if direction == "horizontal" else 0
	$KinematicBody2D/AnimatedSprite.set_offset(Vector2(0,y_offset))
	
func place_cone(x:int, y:int, rot: float) -> void:
	$KinematicBody2D/VisionCone.set_position(Vector2(x, y))
	$KinematicBody2D/VisionCone.set_rotation_degrees(rot)

func _on_VisionCone_body_entered(body):
	if (body.name == "Pingouin"):
		emit_signal("playerspotted")
