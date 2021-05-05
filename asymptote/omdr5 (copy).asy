import graph3;
settings.outformat="pdf";
size(8cm,0);
import mods;
currentprojection = orthographic(3,0,10, up=Y);


draw(O -- 1.3*Y, arrow=Arrow3(TeXHead2, emissive(black)));


real A = 0.8;
real c = 0.4;
int N = 4;
real B = A+c*N;

draw(O -- (B+1)*X, L=Label("$x$",
position=EndPoint), arrow=Arrow3(TeXHead2, emissive(black)));

real f(real x){
    return 1+0.05*x^2;
}
triple f0(real z, real r, real x){
    return (x, r*sin(z), r*cos(z));
}
triple f1(real r){
    return (r, f(r), 0);
}
triple f2(real r){
    return (r, -f(r), 0);
}


for (int n = 0; n <= N; ++ n){ 
    
    real a = A+n*c;
    real b = a+c;
    triple F1(real z){ return f0(z, f(a-c), a); }
    triple F2(real z){ return f0(z, f(a), b); }    
    
    path3 s = graph(F1, -pi/2, pi/2, operator ..);    
    path3 s0 = graph(F1, 3*pi/2, pi/2, operator ..);
    path3 s1 = graph(f1, a, b, operator..);
    path3 s2 = graph(f2, a, b, operator..);
    path3 s3 = graph(F2, 0, 2*pi, operator ..);

    draw(s, blue);      
    draw(s0, blue+dotted+linewidth(0.6pt));
    draw(s1);
    draw(s2, blue);
    write(n);
    write(n<B);
    if (n==N){ write("hei");draw(s3, blue); }
}

//draw(a*X--b*X, L=Label("$dx$", position=MidPoint, align=S));
//draw(surface(s3--cycle),yellow+opacity(.6));


