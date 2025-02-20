extends Node3D

var time  = 0.0

var seed : int = Time.get_ticks_msec()

func _ready() -> void:
	generate()
	pass

func _process(delta: float) -> void:
	time += delta

func generate():
	
	pass
