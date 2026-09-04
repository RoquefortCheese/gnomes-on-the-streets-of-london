extends Node3D
class_name Chunk

var gnomescene: PackedScene = load("res://gnome.tscn")

func create(tile: Vector2):
	position = Util.posheight(tile + Vector2.ONE * World.chunksize / 2.)
	$Building.mesh = $Building.mesh.duplicate(true)
	var height = 2 ** randf_range(2, 5)
	var width = randi_range(4, 7)
	$Building.mesh.size = Util.posheight(Vector2.ONE * width, height * 2)
	$Building.mesh.material.uv1_scale = Vector3.ONE * 2 ** randf_range(-1.25, -0.75)
	$Building.mesh.material.uv1_offset = Util.randv3(256)
	$Building.position = Util.posheight(Util.randdisp(3))
	$Building.create_convex_collision()
	for i in 1:
		var gnome = gnomescene.instantiate()
		gnome.create()
		$Gnomes.add_child(gnome)
		gnome.position = Util.posheight(Util.randdisp(World.chunksize / 2.), 256)
		gnome.velocity.y = -512
		while not gnome.is_on_floor():
			gnome.move_and_slide()
