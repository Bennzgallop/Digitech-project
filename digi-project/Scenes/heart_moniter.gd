extends Control


@onready var endpoint = $Endpoint
@onready var mainui = $".."


@onready var regular1 = $Regular
@onready var regular1connectthingonto = $Regular/ConnectThingonto

@onready var regular2 = $Regular2
@onready var regular2connecthingonto = $Regular2/ConnectThingonto


@onready var fast1 = $Regular3
@onready var fast1connecthingonto = $Regular3/ConnectThingonto

@onready var fast2 = $Regular4
@onready var fast2connecthingonto = $Regular4/ConnectThingonto 

# Called when the node enters the scene tree for the first time. 
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if mainui.character.health > 49:
		var currthing = "reg1"
		regular1.visible = true
		regular2.visible = true
		regular1.position.x -= 0.5
		regular2.position.x -= 0.5
		fast1.position.x -= 0.5
		fast2.position.x -= 0.5
		if fast1:
			if fast1connecthingonto.global_position.x <= endpoint.global_position.x:
				fast1.visible = false
				fast1.global_position.x = regular1connectthingonto.global_position.x
		if fast2:
			if fast2connecthingonto.global_position.x <= endpoint.global_position.x:
				fast2.visible = false
				fast2.global_position.x = fast1connecthingonto.global_position.x
		if regular1:
			if regular1connectthingonto.global_position.x <= endpoint.global_position.x:
				regular1.global_position.x = regular2connecthingonto.global_position.x
				currthing = "reg1"
		if regular2:
			if regular2connecthingonto.global_position.x <= endpoint.global_position.x:
				regular2.global_position.x = regular1connectthingonto.global_position.x
				currthing = "reg2"
	elif mainui.character.health > 24:
		print("Else")
		fast1.visible = true
		fast2.visible = true
		regular1.visible = false
		regular2.visible = false
		fast1.position.x -= 1.5
		fast2.position.x -= 1.5
		regular1.position.x -= 1.5
		regular2.position.x -= 1.5
		if fast1:
			if fast1connecthingonto.global_position.x <= endpoint.global_position.x:
				fast1.global_position.x = fast2connecthingonto.global_position.x
		if fast2:
			if fast2connecthingonto.global_position.x <= endpoint.global_position.x:
				fast2.global_position.x = fast1connecthingonto.global_position.x
		if regular1:
			if regular1connectthingonto.global_position.x <= endpoint.global_position.x:
				regular1.visible = false
				regular1.global_position.x = regular2connecthingonto.global_position.x
		if regular2:
			if regular2connecthingonto.global_position.x <= endpoint.global_position.x:
				regular2.visible = false
				regular2.global_position.x = regular1connectthingonto.global_position.x
