extends Area2D

const SPEED: float = 360.0

var _vp_r: Rect2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_vp_r = get_viewport_rect()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#if Input.is_action_pressed("move_left"):
	#	position.x -= SPEED * delta
		
	#if Input.is_action_pressed("move_right"):	
	#	position.x += SPEED * delta
	
	var movement: float = Input.get_axis("move_left","move_right")
	position.x += SPEED * delta * movement
	
	position.x = clampf(
		position.x,
		_vp_r.position.x,
		_vp_r.end.x
		)
		
func _on_area_entered(area: Area2D) -> void:
	print("_on_area_entered from Paddle definition") # Replace with function body.
