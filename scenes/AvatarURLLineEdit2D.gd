extends Node2D

#var anim_node: AnimationPlayer
var avatar: Node
var http_request: HTTPRequest = HTTPRequest.new()

var draging: bool = false
var difference: float = 0

#func _input(event):
#	if event is InputEventMouseMotion:
#		difference = event.relative.x
#	if event is InputEventMouseButton:
#		draging = event.is_pressed()
#
func _process(delta):
	pass



func _request_completed(result, response_code, headers, body):
	var gltf = GLTFDocument.new()
	var state = GLTFState.new()
	var error = gltf.append_from_buffer(body, "", state)
	avatar = gltf.generate_scene(state)
		
	#anim_node.play("Walk")
	#avatar.add_child(anim_node)
	get_tree().get_current_scene().get_node("AvatarGenerationZone").add_child(avatar)
	avatar.global_transform = get_tree().get_current_scene().get_node("AvatarGenerationZone").global_transform
	
	#$Control/Button.disabled = false
	$LineEdit.text = "Load Avatar"

func _on_LineEdit_text_entered(new_text):
	#if avatar != null:
	#	avatar.free()
	
	#var scene = preload("res://walking.glb").instantiate()
	#anim_node = scene.get_node("AnimationPlayer").duplicate()
	
	if $LineEdit.text == "":
		push_error("URL is empty")
	else:
		#$Control/Button.disabled = true
		$LineEdit.text = "Loading..."
		
		add_child(http_request)
		http_request.connect("request_completed", self, "_request_completed")
		var error = http_request.request($LineEdit.text)
		if error != OK:
			push_error("An error occurred in the HTTP request.")
			#$Control/Button.disabled = false
			$LineEdit.text = "Load Avatar"
