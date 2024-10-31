
varying vec2 vUv;

uniform sampler2D uPerlinTexture;
uniform float uTime;


void main(){

    vec2 smokeUv = vUv;
    smokeUv.x *= .5;
    smokeUv.y *= .3;
    smokeUv.y += -(uTime * .03);

    float smoke = texture(uPerlinTexture, smokeUv).r;

    //smoke remap

    smoke = smoothstep(.4, 1., smoke);

    smoke *= smoothstep( 0., .1, vUv.x );
    smoke *= smoothstep( 1., .9, vUv.x );
    smoke *= smoothstep( 0., .1, vUv.y );
    smoke *= smoothstep( 1., .4, vUv.y );

    // smoke = 1.;
    // smoke = smoothstep(0., 0.1, vUv.x);
    // smoke *= smoothstep(1., 0.9, vUv.x);
    // smoke *= smoothstep(1., 0.9, vUv.y);



    gl_FragColor =  vec4( .6, .3, .4, smoke);
    // gl_FragColor = vec4( 1., 0., 0., 1.);

    #include <colorspace_fragment>    
    #include <tonemapping_fragment>
}