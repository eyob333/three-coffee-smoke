
varying vec2 vUv;
uniform sampler2D uPerlinTexture;
uniform float uTime;

vec2 rotate2D(vec2 value, float angle)
{
    float s = sin(angle);
    float c = cos(angle);
    mat2 m = mat2(c, s, -s, c);
    return m * value;
}

void main(){
    vec3 newPostion = position;

    float twistPerlin = texture( uPerlinTexture,  vec2(.5,  uv.y * .2 - uTime * .005 )).r;
    float angle = twistPerlin * 10.;

    newPostion.xz= rotate2D( newPostion.xz, angle);

    vec2 offsetPerlin = vec2(
        texture( uPerlinTexture, vec2(.25, uTime * .01)).r - .5,
        texture( uPerlinTexture, vec2(.75, uTime * .01)).r - .5
    );

    offsetPerlin *= pow(uv.y, 2.) * 10.;
    newPostion.xz += offsetPerlin;

    gl_Position = projectionMatrix * modelViewMatrix * vec4( newPostion, 1.0);


    vUv = uv; 
}