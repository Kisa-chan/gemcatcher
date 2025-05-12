extends Area2D

class_name Gem

signal gem_off_screen

const SPEED: float = 200.0

var _vp_r: Rect2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_vp_r = get_viewport_rect()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += SPEED * delta
	
	if position.y >_vp_r.end.y:
		print("Gem falls off")
		gem_off_screen.emit()
		die()

func die() -> void:
	set_process(false)
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	print("Gem hits paddle")
	die()
