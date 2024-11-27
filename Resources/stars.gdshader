shader_type spatial;
render_mode unshaded;

uniform sampler2D image;

void fragment() {
	COLOR.rgb = texture(image, UV);
	//ALBEDO = vec3(1.0, 0.0, 0.0);
	//ALBEDO += vec3(0.0, 1.0, 0.0) * float(VIEW_INDEX);
}