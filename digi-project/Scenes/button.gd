extends Button

@export var mainmenu : Control
var parent
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	self.pressed.connect(_on_button_press)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_press():
	parent.visible = false
	mainmenu.visible = true
