shader_type canvas_item;

float random(vec2 st) {
    return fract(sin(dot(st, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    float r = random(UV + floor(sin(TIME) * 2.0));

    if (r > 0.9){
		
		COLOR = vec4(0.1,0.1,0.1,0.1);
	}
	else{
		COLOR = vec4(0,0,0,0);
	}
}


//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
