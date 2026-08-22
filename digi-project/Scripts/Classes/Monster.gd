class_name Monster
extends CharacterBody3D

@export var thing_to_stalk : Node3D
@export var thing_to_stalk2 : Node3D
@export var thing_to_stalk3 : Node3D
@export var time_till_stalk : float
@export var time_till_stalk2 : float
@export var time_till_stalk3 : float
@export var time_to_reset : float
@export var distance_between_thing_to_stalk : Vector3
@export var distance_between_thing_to_stalk2 : Vector3
@export var distance_between_thing_to_stalk3 : Vector3


var is_stalking = false
var selfsposition
var thingstalking = 3
var maxthingstalking = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	selfsposition = self.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_stalking == false:
		if thingstalking >= maxthingstalking:
			self.position = selfsposition
			await get_tree().create_timer(time_till_stalk).timeout
			thingstalking = 1
			is_stalking = true
	if is_stalking == true:
		if thingstalking == 1:
			var pos = thing_to_stalk.position
			self.position = pos - distance_between_thing_to_stalk
			await get_tree().create_timer(time_till_stalk2).timeout
			thingstalking = 2
		elif thingstalking == 2:
			var pos = thing_to_stalk2.position
			self.position = pos - distance_between_thing_to_stalk2
			await get_tree().create_timer(time_till_stalk3).timeout
			thingstalking = 3
		elif thingstalking == 3:
			var pos = thing_to_stalk3.position
			self.position = pos - distance_between_thing_to_stalk3
			await get_tree().create_timer(time_to_reset).timeout
			is_stalking = false
		else:
			push_error("Variable Named 'thingstalking' went to ",maxthingstalking + 1," And Variable named 'is_stalking' Is true Something Went wrong fix it")
			
