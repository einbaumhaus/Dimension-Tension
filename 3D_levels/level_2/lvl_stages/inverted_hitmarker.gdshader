shader_type canvas_item;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    // Invert the RGB channels
    tex.rgb = vec3(1.0) - tex.rgb;
    COLOR = tex;
}
