extends Node2D

export var XLoc = 0
export var YLoc = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Sprite").move_local_x(XLoc)
	get_node("Sprite").move_local_y(YLoc)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
