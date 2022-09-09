extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sounds = [preload("res://sounds/birds1.wav"), preload("res://sounds/birds2.wav"), preload("res://sounds/birds3.wav"), preload("res://sounds/birds4.wav")]
var current_stream_idx : int = 0
var random : RandomNumberGenerator
var wait_time : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	stream = sounds[0]
	play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func play_next():
	if current_stream_idx < (sounds.size()-1):
		stream = sounds[current_stream_idx+1]
		play()
		current_stream_idx += 1
	else:
		stream = sounds[0]
		play()
		current_stream_idx = 0
		
		
func _on_AudioStreamPlayer_finished():
	random = RandomNumberGenerator.new()
	random.randomize()
	wait_time = random.randi_range(0,6)
	yield(get_tree().create_timer(wait_time), "timeout")
	play_next() # Replace with function body.
