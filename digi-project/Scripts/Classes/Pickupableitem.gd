class_name pickupableitem
extends Node3D
@export var area : Area3D
var thinginside = false
var parent : Node3D
var holdingslot : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = self.get_parent()
	area.connect("area_entered",self._on_area_entered)
	area.connect("area_exited",self._on_area_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("G"):
		if thinginside == false:
			print("Nothing Inside Area")
		elif thinginside == true:
			if self.get_parent() == holdingslot:
				self.reparent(parent)
			else:
				if holdingslot.get_child_count() == 0:
					global_position = holdingslot.global_position
					self.reparent(holdingslot)
				else:
					print("Already Holding Smth")



func _on_area_entered(thing : Area3D):
	if thing.get_parent() is CharacterBody3D:
		if thing.name == "Player":
			if thing.holdingslot:
				thinginside = true
				holdingslot = thing.holdingslot


func _on_area_exited(thing : Area3D):
	if thing.get_parent() is CharacterBody3D:
		if thing.name == "Player":
			if thing.holdingslot:
				thinginside = false
