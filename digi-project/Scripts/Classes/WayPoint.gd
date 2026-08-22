class_name Waypoint
extends MeshInstance3D

@export var color : Color = Color.WHITE
@export var Area : Area3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mesh = MeshInstance3D.new()
	add_child(mesh)

	var sphere = SphereMesh.new()
	sphere.radius = 0.3
	sphere.height = 0.6
	mesh.mesh = sphere
	var material = ShaderMaterial.new()
	var shader = Shader.new()

	shader.code = """
	shader_type spatial;
	render_mode unshaded, depth_test_disabled, depth_draw_never;

	uniform vec4 marker_color : source_color;

	void fragment() {
		ALBEDO = marker_color.rgb;
		ALPHA = marker_color.a;
	}
	"""
	material.shader = shader
	material.set_shader_parameter("marker_color", color)

	mesh.material_override = material
	
	Area.connect("area_entered",self._on_area_entered)
	Area.connect("area_exited", self._on_area_exited)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(thing : Area3D):
	print("Thing entered")
	if thing.get_parent() is CharacterBody3D:
		visible = false
func _on_area_exited(thing : Area3D):
	print("Thing Exited")
	if thing.get_parent() is CharacterBody3D:
		visible = true
