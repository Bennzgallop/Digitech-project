extends Control


@onready var endpoint = $Endpoint
@onready var mainui = $".."


@onready var regular1 = $Regular
@onready var regular1connectthingonto = $Regular/ConnectThingonto

@onready var regular2 = $Regular2
@onready var regular2connecthingonto = $Regular2/ConnectThingonto


<<<<<<< Updated upstream
@onready var fast1 = $Regular3
@onready var fast1connecthingonto = $Regular3/ConnectThingonto

@onready var fast2 = $Regular4
@onready var fast2connecthingonto = $Regular4/ConnectThingonto 
=======
@export var fast1 : Control
@export var fast1connecthingonto : Control

@export var fast2 : Control
@export var fast2connecthingonto : Control 

var reg1 = false
var reg2 = false
var fas1 = false
var fas2 = false
>>>>>>> Stashed changes

# Called when the node enters the scene tree for the first time. 
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if mainui.character.health > 49:
<<<<<<< Updated upstream
		var currthing = "reg1"
=======
		reg1 = false
		reg2 = false
>>>>>>> Stashed changes
		regular1.visible = true
		regular2.visible = true
		fast1.visible = false
		fast2.visible = false
		fast1.position.x -= 1
		fast2.position.x -= 1
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
<<<<<<< Updated upstream
				currthing = "reg2"
	elif mainui.character.health > 24:
		print("Else")
=======
		if fast1:
			if fast1connecthingonto.global_position.x <= endpoint.global_position.x:
				fast1.global_position.x = fast2connecthingonto.global_position.x
				fas1 = true
			if fas1 == false:
				fast1.position.x -= 0.5
		if fast2:
			if fast2connecthingonto.global_position.x <= endpoint.global_position.x:
				fast2.global_position.x = fast1connecthingonto.global_position.x
				fas2 = true
			if fas2 == false:
				fast2.position.x -= 0.5
	elif mainui.character.health > 24:
		print("Else")
		fas1 = false
		fas2 = false
>>>>>>> Stashed changes
		fast1.visible = true
		fast2.visible = true
		regular1.visible = false
		regular2.visible = false
<<<<<<< Updated upstream
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
=======
		fast1.position.x -= 1
		fast2.position.x -= 1
		regular1.position.x -= 0.5
		regular2.position.x -= 0.5
>>>>>>> Stashed changes
		if regular1:
			if regular1connectthingonto.global_position.x <= endpoint.global_position.x:
				regular1.visible = false
				regular1.global_position.x = regular2connecthingonto.global_position.x
				reg1 = true
			if reg1 == false:
				regular1.position.x -= 1
		if regular2:
			if regular2connecthingonto.global_position.x <= endpoint.global_position.x:
				regular2.visible = false
				regular2.global_position.x = regular1connectthingonto.global_position.x
				reg2 = true
			if reg2 == false:
				regular2.position.x -= 1
		if fast1:
			if fast1connecthingonto.global_position.x <= endpoint.global_position.x:
				fast1.global_position.x = fast2connecthingonto.global_position.x
		if fast2:
			if fast2connecthingonto.global_position.x <= endpoint.global_position.x:
				fast2.global_position.x = fast1connecthingonto.global_position.x
