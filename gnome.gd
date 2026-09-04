extends CharacterBody3D
class_name Gnome
enum Type {BLUE, MAGE, GOLD}

var type: Type

func create():
	type = Type.BLUE
	if Util.coinflip():
		type = Type.MAGE
		if Util.coinflip():
			type = Type.GOLD
	$AnimatedSprite3D.animation = StringName("idling-" + Util.antidict(Type)[type].to_lower())
	$AnimatedSprite3D.set_frame_and_progress(randi(), randf())
	$AnimatedSprite3D.play()
