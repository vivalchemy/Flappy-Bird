extends TileMap

var wall
# Called when the node enters the scene tree for the first time.
func _ready():
	# Set top pipe
	var randRangeTop = randi_range(1,15)	
	
	for i in randRangeTop:
		set_cell(0, Vector2i(6, i), 0, Vector2i(0, 2), 0)
	
	set_cell(0, Vector2i(6, randRangeTop), 0, Vector2i(0, 3), 0)
	set_cell(0, Vector2i(6, randRangeTop+1), 0, Vector2i(0, 4), 0)
	
	# Set bottom pipe
	set_cell(0, Vector2i(6, randRangeTop+8), 0, Vector2i(0, 0), 0)
	set_cell(0, Vector2i(6, randRangeTop+7), 0, Vector2i(0, 0), 0)
	
	for i in 15:
		set_cell(0, Vector2i(6, randRangeTop+8 +i), 0, Vector2i(0, 2), 0)
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.x -= 60*delta

func _on_area_2d_body_entered(body):
	if "Bird" in body.name:
		Global.points += 1
