extends Node2D
signal on_lampadaire_spotted

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PathFollow2D_on_body_entered():
	emit_signal("on_lampadaire_spotted")
