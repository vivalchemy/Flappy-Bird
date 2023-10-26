extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.start:
		pass
	else:
		self.position.y = 120
		self.set_linear_velocity(Vector2(0, -150))

func _input(event):
	if event is InputEventMouseButton:
		self.set_linear_velocity(Vector2(0, -150))
		self.set_angular_velocity(-3)
		$AnimatedSprite2D.play("Fly")

func _on_area_2d_body_entered(body):
	if body.name == "Floor":# Replace with function body.
		Global.start = false
		self.hide()
		$"../btnNewGame".show()
		$"../btnExit".show()
	if "wall" in body:
		Global.start = false
		self.hide()
		$"../btnNewGame".show()
		$"../btnExit".show()
