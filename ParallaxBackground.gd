extends ParallaxBackground
@onready var pipe = preload("res://pipes.tscn")


@export var scrollSpeed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.scroll_base_offset.x -= scrollSpeed * delta

func spawn():
	add_child(pipe.instantiate())


func _on_timer_timeout():
	if Global.start:
		spawn() # Replace with function body.



func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_new_game_pressed():
	Global.start = true
	Global.points = 0
	$"../btnNewGame".hide()
	$"../btnExit".hide()
	$"../Bird".show()
