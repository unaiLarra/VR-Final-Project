// Godot 4.3, Forward+ or Mobile
shader_type spatial;
render_mode unshaded, fog_disabled;

uniform sampler2D screen_texture : source_color, hint_screen_texture;
uniform sampler2D depth_texture : hint_depth_texture;
uniform sampler2D normal_rough_texture : hint_normal_roughness_texture;
uniform float threshold;
uniform bool threshold_active;
uniform int viewport_index;

void vertex() {
	POSITION = vec4(VERTEX.xy, 1.0, 1.0);
}

void fragment() {
	int is_shown = clamp(abs(VIEW_INDEX-viewport_index),0,1);
	vec4 screen = texture(screen_texture, SCREEN_UV);
	float avg = (screen.r + screen.g + screen.b) / 3.0;
	if (avg > threshold && threshold_active) {
		avg = 1.0;
	} else if (threshold_active) {
		avg = 0.0;
	}
	if (threshold_active && is_shown == 1) {
		ALBEDO.rgb = vec3(avg);
	} else {
		ALBEDO.rgb = screen.rgb;
	}
}