#version 140

uniform sampler2D texture_sampler;
uniform fs_uniforms
{
    vec4 tint;
};

in vec2 var_texcoord0;
out vec4 color_out;


void main()
{


    lowp vec4 tex = texture(texture_sampler, var_texcoord0.xy);


    lowp vec4 tint_pm = vec4(tint.xyz, tint.w) * tex.a; 
    // We multiply the textures alpha channel as mask for the tint color 


    lowp vec4 final_color = mix(tex, tint_pm, tint_pm.a); 
    // We avoid if statement computations and instead use mix function > https://registry.khronos.org/OpenGL-Refpages/gl4/html/mix.xhtml



    color_out = vec4(final_color.rgb,tex.a);
    // If tint_pm.w value is 0 then "tex.rgb" is returned and if value is 1 then "tint_pm.rgb" is returned to final_color.


}