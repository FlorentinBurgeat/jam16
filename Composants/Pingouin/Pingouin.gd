extends KinematicBody2D

# Declare member variables here. Examples:
export var speed = 300
export var can_move: bool = true

func calculateVelocity(target):
	return target.normalized() * speed

func updatePosition(velocity: Vector2, delta):
	position += velocity * delta


func calculateTargetedPosition():
	var position_targeted = Vector2()
	if Input.is_action_pressed("ui_up"):
		position_targeted.y -= 1
	if Input.is_action_pressed("ui_down"):
		position_targeted.y += 1
	if Input.is_action_pressed("ui_left"):
		position_targeted.x -= 1
	if Input.is_action_pressed("ui_right"):
		position_targeted.x +=1
	return position_targeted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		var velocity = calculateVelocity(calculateTargetedPosition())
		updatePosition(velocity, delta)
