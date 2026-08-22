extends Control

@onready var questlabel = $Label
@export var character : CharacterBody3D
@export var quest1 : Node3D
@export var closeenough : int
@export var Nodes : Array[Node3D]


var whichquest = 1
var quests = [
	"Activate Your Flash Light (Press F)",
	"Go to the Waypoint",
	"There Are No Quests To Do"
]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(quests)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.visible = true
	if whichquest == 1:
		questlabel.text = "Quest: " + quests[whichquest - 1]
		if character.spotlightenabled:
			whichquest = 2
	elif whichquest == 2:
		questlabel.text = "Quest: " + quests[whichquest - 1]
		var pos = Nodes[0].position
		var distance =  (character.position - pos).length()
		if distance <  closeenough:
			whichquest = 3
	elif whichquest == 3:
		questlabel.text = "Quest: " + quests[whichquest - 1]
