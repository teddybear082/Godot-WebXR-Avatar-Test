extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_left_Function_Pickup_has_picked_up(what):
	#var webxr_interface = ARVRServer.find_interface("WebXR")
	#var controller = webxr_interface.get_controller(1)
	#controller.gamepad.hapticActuators[0].pulse(.5, 200)
	#get_parent().get_node("ARVROrigin/LeftController").set_rumble(0.3)
	#yield(get_tree().create_timer(.2), "timeout")
	#get_parent().get_node("ARVROrigin/LeftController").set_rumble(0.0)
	Input.start_joy_vibration(100, .5, .5, .2)

func _on_right_Function_Pickup_has_picked_up(what):
	#get_parent().get_node("ARVROrigin/RightController").set_rumble(0.3)
	#yield(get_tree().create_timer(.2), "timeout")
	#get_parent().get_node("ARVROrigin/RightController").set_rumble(0.0)
	#var webxr_interface = ARVRServer.find_interface("WebXR")
	#var controller = webxr_interface.get_controller(2)
	#controller.gamepad.hapticActuators[0].pulse(.5, 200)
	Input.start_joy_vibration(101, .5, .5, .2)
