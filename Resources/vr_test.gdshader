shader_type spatial;
render_mode unshaded;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = vec3(1.0, 0.0, 0.0);
	ALBEDO += vec3(0.0, 1.0, 0.0) * float(VIEW_INDEX);
}