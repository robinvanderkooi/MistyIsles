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
		
		var img = Image.create(childs[0].texture.width,childs[0].texture.height,true,Image.FORMAT_RGBA8)
		
		var imgs = []
		for chil:TextureRect in childs:
			imgs.append(chil.texture.get_image())
		for x in childs[0].texture.width:
			for y in childs[0].texture.height:
				var r = 1.0
				var g = 1.0
				var b = 1.0
				for i in imgs.size():
					var p : Color = imgs[i].get_pixel(x,y)
					r *= p.r
					g *= p.g
					b *= p.b
				#r /= float(childs.size())
				#g /= float(childs.size())
				#b /= float(childs.size())
				img.set_pixel(x,y, Color(r,g,b,1.0))
		var maxr = 0.0
		for x in childs[0].texture.width:
			for y in childs[0].texture.height:
				var p = img.get_pixel(x,y)
				if p.r > maxr : maxr = p.r
		var sca = 1.0 / maxr
		for x in childs[0].texture.width:
			for y in childs[0].texture.height:
				img.set_pixel(x,y, img.get_pixel(x,y) * sca)
		
		var itex : ImageTexture = ImageTexture.create_from_image(img)
		#tex.texture = itex
		#tex.size = Vector2i(64,64)
		#%Textures.add_child(tex)
		%Result.texture = itex
		initialized_result = true
		%Result.queue_redraw()
		#img.save_png("res://result_image.png")
	pass

func _refresh_result():
	pass
