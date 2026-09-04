extends Node
class_name World

const chunksize = 10
const radius = 8
var chunks: Dictionary[Vector2, Chunk]
var chunkscene: PackedScene = load("res://chunk.tscn")

func _process(delta: float):
	genchunks()

func genchunks():
	var playerchunk = floor(Vector2($Player.position.x, $Player.position.z) / chunksize) * chunksize
	for x in range(-radius * chunksize, (radius + 1) * chunksize, chunksize):
		for y in range(-radius * chunksize, (radius + 1) * chunksize, chunksize):
			var tile = Vector2(x, y) + playerchunk
			if tile not in chunks:
				var chunk = chunkscene.instantiate()
				$Chunks.add_child(chunk)
				chunk.create(tile)
				chunks[tile] = chunk
