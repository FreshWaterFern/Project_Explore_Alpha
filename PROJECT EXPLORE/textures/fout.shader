float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
// Varyings
static float2 _v_texcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _gm_AlphaRefValue : register(c3);
uniform bool _gm_AlphaTestEnabled : register(c4);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c5);
uniform bool _gm_PS_FogEnabled : register(c6);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
void gl_main()
{
{
float4 _sum = float4(0.0, 0.0, 0.0, 0.0);
float2 _q1 = _v_texcoord;
float4 _oricol = gl_texture2D(_gm_BaseTexture, vec2(_q1.x, _q1.y));
float3 _col = {0, 0, 0};
{for(int _i = -3; (_i < 3); (_i++))
{
{
{for(int _j = -2; (_j < 2); (_j++))
{
{
(_sum += (gl_texture2D(_gm_BaseTexture, ((vec2(float(_j), float(_i)) * 0.0027999999) + vec2(_q1.x, _q1.y))) * 0.30000001));
}
;}
}
;
}
;}
}
;
if((_oricol.x < 0.40000001))
{
{
(gl_Color[0] = (((_sum * _sum) * 0.012) + _oricol));
}
;
}
else
{
{
if((_oricol.x < 0.60000002))
{
{
(gl_Color[0] = (((_sum * _sum) * 0.0089999996) + _oricol));
}
;
}
else
{
{
(gl_Color[0] = (((_sum * _sum) * 0.0074999998) + _oricol));
}
;
}
;
}
;
}
;
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_texcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
