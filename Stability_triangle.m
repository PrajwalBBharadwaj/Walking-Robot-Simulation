clear all
L = 40;%length of the body
B = 27;%width of the body
stroke1 = 12;stroke2 = 8;stroke3 = 12;stroke4 = 8;%stroke length
s1 = stroke1/2;s2 = stroke2/2;s3 = stroke3/2;s4 = stroke4/2;%forward part of the stroke
f1 =1;f2 =1;f3 =1;f4=1;%frequency
T=1;%time period
dc = 0.8*T;%duty cycle
ph1 = 0*T; ph2 =0.5*T; ph3 = 0.25*T; ph4 = 0.75*T;%phases
d = 1;%y distance of leg separation from body
%----------------------------------------------------%
for t = 0:0.001:3
    t = mod(t,1);
    if mod(f1*t+ph1,T)<dc && mod((f1*t+ph1),T)>0
        x1 = (-L/2 - s1 + stroke1/dc*mod((f1*t+ph1),T));
        y1 = (-B/2-d);
    else 
        x1 = (L/2 - s4 + stroke4/dc*mod(f4*t+ph4,T));
        y1 = (B/2+d);
    end
%----------------------------------------------------%
     if mod(f2*t+ph2,T)<dc && mod(f2*t+ph2,T)>0
        x2 =  (-L/2 - s2 + stroke2/dc*mod((f2*t+ph2),T));
        y2 = (+B/2+d);
     else 
        x2 = (L/2 - s3 + stroke3/dc*mod(f3*t+ph3,T));
        y2 = (-B/2-d);     

     end
%-----------------------------------------------%         
     if mod(f3*t+ph3,T)<dc && mod(f3*t+ph3,T)>0
        x3 = (L/2 - s3 + stroke3/dc*mod((f3*t+ph3),T));
        y3 = (-B/2-d);     
       else
        x3 = (-L/2 - s2 + stroke2/dc*mod(f2*t+ph2,T));
        y3 =  (+B/2+d);
     end
%----------------------------------------------%     
     if mod(f4*t+ph4,T)<dc && mod(f4*t+ph4,T)>0
        x4 = (L/2 - s4 + stroke4/dc*mod((f4*t+ph4),T));
        y4 = (B/2+d);    
     else 
        x4 = (-L/2 - s1 + stroke1/dc*mod(f1*t+ph1,T));
        y4 = (-B/2-d);         
     end
%------------------------------------------%
X1 = [-L/2-s1 -L/2+(stroke1-s1)];
Y1 = [-B/2-d -B/2-d];
X2 = [-L/2-s2 -L/2+(stroke2-s2)];
Y2 = [B/2+d B/2+d];
X3 = [L/2-s3 L/2+(stroke3-s3)];
Y3 = [-B/2-d -B/2-d];
X4 = [L/2-s4 L/2+(stroke4-s4)];
Y4 = [B/2+d B/2+d];

Lx1 = [x1 x2]; Lx2 = [x1 x3]; Lx3 = [x1 x4]; Lx4 = [x2 x3]; Lx5 = [x2 x4]; Lx6 = [x3 x4];
Ly1 = [y1 y2]; Ly2 = [y1 y3]; Ly3 = [y1 y4]; Ly4 = [y2 y3]; Ly5 = [y2 y4]; Ly6 = [y3 y4];
grid on;
plot(X1,Y1,'b',X2,Y2,'b',X3,Y3,'b',X4,Y4,'b',...
     x1,y1,'*',x2,y2,'*',x3,y3,'*',x4,y4,'*',0,0,'.',...
     Lx1,Ly1,Lx2,Ly2,Lx3,Ly3,Lx4,Ly4,Lx5,Ly5,Lx6,Ly6);
rectangle('Position',[-L/2 -B/2 L B]);
axis([-L/2-s1-5 L/2+(stroke1-s1)+5 -2*B/3 2*B/3]);
grid on;
grid minor;
F = getframe;
end
         
        
        
        
        
    
    