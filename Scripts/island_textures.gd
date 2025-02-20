extends Node3D
##TODO combine the texutres


var ran_inity = false
var initialized_result = false

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not ran_inity :
		ran_inity = not ran_inity
		_initialize_result()
	#TODO A timer to reset the map is the seed changed.
	pass

func _initialize_result():
	if not initialized_result:
		var childs = self.get_children()
		var resultname = %Result.name
		var t0 :Texture2D = %Result.texture
		var i0 :Image = t0.get_image()
		var resetimage = true
		var tex_count = 1
		for chil in childs:
			if resetimage :
				resetimage = false
				for x in i0.get_width():
					for y in i0.get_height():
						i0.set_pixel(x,y,Color.WHITE)
			var t1:TextureRect = chil
			if t1.name == resultname : continue
			tex_count += 1
			var tex :Texture = t1.texture
			var i1 :Image = tex.get_image()
			for x in i1.get_width():
				for y in i1.get_height():
					var p0 = i0.get_pixel(x,y)
					var p1 = i1.get_pixel(x,y)
					var px = (p0 * p1) * 1.2
					i0.set_pixel(x,y, px)
		initialized_result = true
		i0.save_png("res://result_image.png")
		%Result.queue_redraw()
	pass

func _refresh_result():
	pass
