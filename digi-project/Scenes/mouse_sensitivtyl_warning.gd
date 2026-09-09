extends Label
@export var mousesensiticyty : LineEdit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: #Pretty sure u under stand
	if mousesensiticyty.text.to_float() > 0.06:
		visible = true
		text = "* do not recomend it is to high"
	elif mousesensiticyty.text.to_float() < 0.001:
		visible = true
		text = "* do not recomend it is to low"
	else:
		visible = false
