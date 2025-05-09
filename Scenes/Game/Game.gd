extends Node2D

const GEM = preload("res://Scenes/Gem/Gem.tscn")
const MARGIN: float = 70.0

@onready var spawn_timer: Timer = $SpawnTimer
@onready var paddle: Area2D = $Paddle


func _ready() -> void:
	spawn_gem()

func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(
		get_viewport_rect().position.x + MARGIN,
		get_viewport_rect().end.x - MARGIN
		)
	var y_pos: float = -50.0
	new_gem.position = Vector2(x_pos, y_pos)
	new_gem.gem_off_screen.connect(_on_gem_gem_off_screen)
	add_child(new_gem)


func stop_all() -> void:
	spawn_timer.stop()
	paddle.set_process(false)
	for child in get_children():
		if child is Gem: 
			child.set_process(false)
	

func _on_paddle_area_entered(area: Area2D) -> void:
	print("Collision ", area) # Replace with function body.
	
	


func _on_gem_gem_off_screen() -> void:
	stop_all() # Replace with function body.


func _on_timer_timeout() -> void:
	spawn_gem() # Replace with function body.
