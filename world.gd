extends Node
class_name World

const chunksize = 8
const radius = 14
var chunks: Dictionary[Vector2, Chunk]
@export var chunkscene: PackedScene

func _process(delta: float):
	genchunks()

func genchunks():
	var playerchunk = floor(Vector2($Player.position.x, $Player.position.z) / chunksize) * chunksize
	for x in range(-radius * chunksize, (radius + 1) * chunksize, chunksize):
		for y in range(-radius * chunksize, (radius + 1) * chunksize, chunksize):
			var tile = Vector2(x, y) + playerchunk
			if tile not in chunks:
				var chunk = chunkscene.instantiate()
				chunk.create(tile)
				$Chunks.add_child(chunk)
				chunks[tile] = chunk
