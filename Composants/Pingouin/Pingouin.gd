extends KinematicBody2D

# Declare member variables here. Examples:
export var speed = 200
export var can_move: bool = true

signal loose

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


func _on_spotted():
	print_debug("spotted")
	emit_signal("loose")

func _on_Sortie_body_entered(body):
	print_debug(body.name)
	print_debug('Victoire !') # Replace with function body.
	if (body.name == "Pingouin"):
		get_tree().change_scene("res://Scenes/Ecran-titre.tscn")
