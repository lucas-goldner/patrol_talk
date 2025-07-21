// assets/shaders/liquid_glass.frag
#include <flutter/runtime_effect.glsl>

uniform vec2 uSize;      // width, height
uniform vec2 uTouch;     // touch position in pixels (or vec2(0))
uniform sampler2D uTexture;

out vec4 fragColor;

#define PI    3.14159265
#define S(a, b, c) smoothstep(a, b, c)
float PX(float a) { return a / uSize.y; }

mat2 Rot(float a) {
  return mat2(
    cos(a), -sin(a),
    sin(a),  cos(a)
  );
}

float Box(vec2 p, vec2 b) {
  vec2 d = abs(p) - b;
  return length(max(d, 0.0)) + min(max(d.x, d.y), 0.0);
}

float IconPhoto(vec2 uv) {
  float c = 0.0;
  for (float i = 0.0; i < 1.0; i += 1.0/8.0) {
    vec2 u = Rot(i * 2.0 * PI) * uv;
    u += vec2(0.0, PX(40.0));
    float b = Box(u, vec2(PX(0.0), PX(13.0)));
    c += S(PX(1.5), 0.0, b - PX(15.0)) * 0.2;
  }
  return c;
}

vec4 LiquidGlass(vec2 uv, float direction, float quality, float size) {
  vec2 radius = vec2(size) / uSize;
  vec4 color = texture(uTexture, uv);

  // direction = 8
  const float stepAngle = PI / 8.0;
  for (float d = 0.0; d < PI; d += stepAngle) {

    vec2 dirVec = vec2(cos(d), sin(d));

    // quality = 4
    color += texture(uTexture, uv + dirVec * radius * 0.25);
    color += texture(uTexture, uv + dirVec * radius * 0.50);
    color += texture(uTexture, uv + dirVec * radius * 0.75);
    color += texture(uTexture, uv + dirVec * radius * 1.00);
  }

  // total samples = 1 (original) + 8 directions * 4 samples = 33
  return color / 33.0;
}

vec4 Icon(vec2 uv) {
  float box   = Box(uv, vec2(PX(50.0)));
  float shape = S(PX(1.5), 0.0, box - PX(50.0));
  float disp  = S(PX(35.0), 0.0, box - PX(25.0));
  float light = shape * S(0.0, PX(30.0), box - PX(40.0));
  float photo = IconPhoto(uv);
  return vec4(shape, disp, light, photo);
}

void main() {
  vec2 fragPos = FlutterFragCoord().xy;
  vec2 uv  = fragPos / uSize;
  vec2 st  = (fragPos - 0.5 * uSize) / uSize.y;

  // normalize touch to same coordinate space as st:
  vec2 M = (uTouch.xy - 0.5 * uSize) / uSize.y;

  vec4 icon = Icon(st - M);

  // distortion
  vec2 uv2 = uv;
  uv2 -= 0.5;
  uv2 *= 0.5 + 0.5 * S(0.5, 1.0, icon.y);
  uv2 += 0.5;

  vec3 col = mix(
    texture(uTexture, uv).rgb * 0.8,
    0.2 + LiquidGlass(uv2, 10.0, 10.0, 20.0).rgb * 0.7,
    icon.x
  );
  col += icon.z * 0.9 + icon.w;
  col *= 1.0 - 0.2 * S(
    PX(80.0), 0.0,
    Box(st + vec2(0.0, PX(40.0)), vec2(PX(50.0)))
  );

  fragColor = vec4(col, 1.0);
}