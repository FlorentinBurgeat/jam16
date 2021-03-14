extends KinematicBody2D

# Declare member variables here. Examples:
export var speed = 200
export var can_move: bool = true

func calculateVelocity(target):
	return target.normalized() * speed


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
	var velocity = calculateVelocity(calculateTargetedPosition())
	if can_move:
		move_and_collide(velocity * delta)
	if velocity.x != 0 || velocity.y != 0 :
		if $AnimatedSprite.playing == false:
			$AnimatedSprite.play("walk")
		if velocity.x < 0 :
			$AnimatedSprite.set_flip_h(true)
		if velocity.x > 0  : 
			$AnimatedSprite.set_flip_h(false)
	else:
		$AnimatedSprite.stop()


func _on_VisionCone_body_entered(body):
	print_debug('SPOTTED Cone de vision - TODO')


func _on_Spotlight1_on_body_entered():
	print_debug('SPOTTED Spotlight - TODO')

