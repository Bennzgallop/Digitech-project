shader_type spatial;

render_mode unshaded, depth_test_disabled, depth_draw_never;

void fragment() {
    ALBEDO = vec3(1.0, 1.0, 1.0);
}