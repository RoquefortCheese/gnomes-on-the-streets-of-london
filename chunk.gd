extends Node3D
class_name Chunk

func create(tile: Vector2):
	position = Vector3(tile.x + World.chunksize / 2., 0, tile.y + World.chunksize / 2.)
	$Building.mesh = $Building.mesh.duplicate(true)
	$Building.mesh.size.y = 2 ** randf_range(2, 5) * 2
	$Building.mesh.material.uv1_scale = Vector3.ONE * 2 ** randf_range(-1.25, -0.75)
	$Building.mesh.material.uv1_offset = Vector3(randf(), randf(), randf()) * 256
	$Building.position = Vector3(randf(), 0, randf()) * 4
	$Building.create_trimesh_collision()
