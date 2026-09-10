extends Control


@onready var endpoint = $Endpoint
@onready var mainui = $".."


@onready var regular1 = $Regular
@onready var regular1connectthingonto = $Regular/ConnectThingonto

@onready var regular2 = $Regular2
@onready var regular2connecthingonto = $Regular2/ConnectThingonto


@onready var fast1 =
@onready var fast1connecthingonto = 

@onready var fast2 = 
@onready var fast2connecthingonto = 

# Called when the node enters the scene tree for the first time. 
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if mainui.character.health > 49:
		regular1.visible = true
		regular2.visible = true
		regular1.position.x -= 0.5
		regular2.position.x -= 0.5
		if regular1:
			if regular1connectthingonto.global_position.x <= endpoint.global_position.x:
				regular1.global_position.x = regular2connecthingonto.global_position.x
		if regular2:
			if regular2connecthingonto.global_position.x <= endpoint.global_position.x:
				regular2.global_position.x = regular1connectthingonto.global_position.x
	elif mainui.character.health > 24:
		print("Else")
		regular1.visible = true
		regular2.visible = true
		regular1.position.x -= 1.5
		regular2.position.x -= 1.5
		if regular1:
			if regular1connectthingonto.global_position.x <= endpoint.global_position.x:
				regular1.global_position.x = regular2connecthingonto.global_position.x
		if regular2:
			if regular2connecthingonto.global_position.x <= endpoint.global_position.x:
				regular2.global_position.x = regular1connectthingonto.global_position.x
