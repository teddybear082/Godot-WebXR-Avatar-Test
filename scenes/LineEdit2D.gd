extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LineEdit_text_entered(new_text):
	if new_text.is_valid_float() == true and (abs(float(new_text)) <= 1.0):
		PlayerMasterControls.player_height_offset = float(new_text) # Replace with function body.
		$LineEdit.text = "Accepted!"
		yield(get_tree().create_timer(2), "timeout")
		$LineEdit.text = ""
	else:
		$LineEdit.text = "ERR: Use 0.0 to 1.0"
		yield(get_tree().create_timer(2), "timeout")
		$LineEdit.text = ""
