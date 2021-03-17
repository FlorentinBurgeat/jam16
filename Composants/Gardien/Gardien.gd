extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 10
var move_direction = 0
onready var path_follow = get_parent()
# Called when the node enters the scene tree for the first time.

func movementLoop(delta):
	var prepos = path_follow.get_global_position()
	path_follow.set_offset(path_follow.get_offset() + speed + delta)
	var pos = path_follow.get_global_position()
	move_direction = (pos.angle_to_point(prepos)/3.14)*180
	
	
   
	

func _physics_process(delta):
	movementLoop(delta)
