//
//  HalftoneDots.metal
//  swiftui-animations-examples
//
//  Created by Satish Vekariya on 10/07/2025.
//

#include <metal_stdlib>
using namespace metal;

// MARK: - Value noise -> fbm (drives the soft, blobby field)

static float hash(float2 p) {
    p = fract(p * float2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

static float valueNoise(float2 p) {
    float2 i = floor(p);
    float2 f = fract(p);
    float2 u = f * f * (3.0 - 2.0 * f);      // smoothstep interpolation
    float a = hash(i);
    float b = hash(i + float2(1.0, 0.0));
    float c = hash(i + float2(0.0, 1.0));
    float d = hash(i + float2(1.0, 1.0));
    return mix(mix(a, b, u.x), mix(c, d, u.x), u.y);
}

static float fbm(float2 p) {
    float value = 0.0;
    float amplitude = 0.5;
    for (int i = 0; i < 4; i++) {
        value += amplitude * valueNoise(p);
        p *= 2.0;
        amplitude *= 0.5;
    }
    return value;
}

// MARK: - Halftone dot field
//
// A regular grid of dots whose radius (and opacity) is modulated by a
// slowly drifting fractal field, so soft "blobs" of larger dots wander
// across the surface. Between dots the pixel is fully transparent, so
// whatever sits behind the effect shows through.

[[ stitchable ]]
half4 halftoneDots(float2 position, half4 color, float2 size, float time) {
    const float pitch = 3.0;                            // centre-to-centre spacing (pt) — FIXED
    const float maxRadius = 1.0;                        // largest dot = 2pt diameter
    const half3 dotColor = half3(0.451, 0.416, 0.565);  // #736A90

    // Nearest dot centre for this pixel + local offset from it.
    // `pitch` is constant, so centres never move as dots resize; only the
    // radius below changes, so the gap between dots only ever grows.
    float2 cell = floor(position / pitch);
    float2 center = (cell + 0.5) * pitch;
    float2 local = position - center;

    // Drifting fractal field, sampled per-cell -> 0...1 intensity.
    // Lower frequency = larger, billowier forms; the wide smoothstep window
    // feathers the sparse<->dense transition so edges read as soft cloud.
    float2 uv = center / max(size, float2(1.0));
    float field = fbm(uv * 2.4 + float2(time * 0.15, time * 0.10));
    field = smoothstep(0.22, 0.95, field);

    // Field scales the radius only, within [0, maxRadius]. At full field the
    // dot is 2pt across; the 3pt pitch leaves a 1pt minimum gap.
    float radius = field * maxRadius;

    // Resolution-independent antialiasing (~1px edge regardless of dot size).
    float dist = length(local);
    float aa = fwidth(dist);
    float alpha = 1.0 - smoothstep(radius - aa, radius + aa, dist);
    alpha *= field;                                     // empty regions stay empty

    // Premultiplied output.
    return half4(dotColor * alpha, alpha);
}
