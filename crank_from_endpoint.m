clear all
r2 = 20;
r1 = 10;
xc1 = +2.5; yc1 = 0;
xc2 = -2.5; yc2 = 0;
ph =0.75;
i=1;
j=1;
m=1;
w=2*pi;
f = 1;%Hz
dc = 0.8;
p=0;
for t = 0:0.01:1
x0(m) = 0.00+ 2.7446*cos(w*t)+ 3.7777*sin(w*t)+ 2.0750*cos(2*w*t)+.6742*sin(2*w*t)+1.2319*cos(3*w*t) -.4003*sin(3*w*t)+.4819*cos(4*w*t)-.6634*sin(4*w*t)-.0001*cos(5*w*t)-.5197*sin(5*w*t)-.1862*cos(6*w*t)-.2562*sin(6*w*t)-.1682*cos(7*w*t)-.0546*sin(7*w*t)-.0783*cos(8*w*t)+.0254*sin(8*w*t)-.0127*cos(9*w*t)-.0175*sin(9*w*t)-.0*cos(10*w*t)-.0137*sin(10*w*t)-.0178*cos(11*w*t)-.0245*sin(11*w*t)-.0324*cos(12*w*t)-.0105*sin(12*w*t)-0.0283*cos(13*w*t)+.00092*sin(13*w*t)-0.0125*cos(14*w*t)-0.0172*sin(14*w*t)-0.0*cos(15*w*t)+.0116*sin(15*w*t);
y0(m) = -17.6267+ 0.5872*cos(w*t) - .4266*sin(w*t) + 0.2058*cos(2*w*t) -.6335*sin(2*w*t) - 0.1777*cos(3*w*t) - .5468*sin(3*w*t)-.3750*cos(4*w*t)- 0.2725*sin(4*w*t)-.3450*cos(5*w*t)-.0*sin(5*w*t)-.1873*cos(6*w*t)+ .1361*sin(6*w*t)-.0413*cos(7*w*t)+.1270*sin(7*w*t)+.0178*cos(8*w*t)+.0548*sin(8*w*t)+.0052*cos(9*w*t)+.0038*sin(9*w*t)-.0216*cos(10*w*t)+.0*sin(10*w*t)-0.0248*cos(11*w*t)+0.0180*sin(11*w*t)-.0083*cos(12*w*t)+0.0254*sin(12*w*t)+0.0050*cos(13*w*t)+0.0155*sin(13*w*t)+0.0038*cos(14*w*t)+0.0028*sin(14*w*t)-0.0043*cos(15*w*t)+.0*sin(15*w*t);
m=m+1;
end
T1 = 0.5+ph;
T2 = 10+ph;
dt = 0.5;
grid on;
grid minor;
for t = ph:0.01:10+ph
         T(i)=t;
        if t<T1
         tp(i)= T(1);
    elseif t<T1+dt
         tp(i)=(t-T1)^2/(2*dt)+T(1); 
    elseif t<T2-dt
         tp(i)= t - (T1+dt/2)+T(1);
    elseif t<T2
         tp(i) = T2-T1-T2^2/(2*dt)-dt+T2*t/dt-t^2/(2*dt)+T(1);
    else tp(i)= T2-T1-dt+T(1);     
        end

   %-----------------------------------------------
%      t_= f*tp(i)+p; % t_ is a variable used to concise below conditions
%      if mod(t_,1) < dc
%          tp(i)=0.8*t_/dc-f*T(1);
%      else
%          tp(i)=0.8+0.2*(t_-dc)/(1-dc)-f*T(1);
%      end     
% %------------------------------------------%
x1(j) = 0.00+ 2.7446*cos(w*tp(i))+ 3.7777*sin(w*tp(i))+ 2.0750*cos(2*w*tp(i))+.6742*sin(2*w*tp(i))+1.2319*cos(3*w*tp(i)) -.4003*sin(3*w*tp(i))+.4819*cos(4*w*tp(i))-.6634*sin(4*w*tp(i))-.0001*cos(5*w*tp(i))-.5197*sin(5*w*tp(i))-.1862*cos(6*w*tp(i))-.2562*sin(6*w*tp(i))-.1682*cos(7*w*tp(i))-.0546*sin(7*w*tp(i))-.0783*cos(8*w*tp(i))+.0254*sin(8*w*tp(i))-.0127*cos(9*w*tp(i))-.0175*sin(9*w*tp(i))-.0*cos(10*w*tp(i))-.0137*sin(10*w*tp(i))-.0178*cos(11*w*tp(i))-.0245*sin(11*w*tp(i))-.0324*cos(12*w*tp(i))-.0105*sin(12*w*tp(i))-0.0283*cos(13*w*tp(i))+.00092*sin(13*w*tp(i))-0.0125*cos(14*w*tp(i))-0.0172*sin(14*w*tp(i))-0.0*cos(15*w*tp(i))+.0116*sin(15*w*tp(i));
y1(j) = -17.6267+ 0.5872*cos(w*tp(i)) - .4266*sin(w*tp(i)) + 0.2058*cos(2*w*tp(i)) -.6335*sin(2*w*tp(i)) - 0.1777*cos(3*w*tp(i)) - .5468*sin(3*w*tp(i))-.3750*cos(4*w*tp(i))- 0.2725*sin(4*w*tp(i))-.3450*cos(5*w*tp(i))-.0*sin(5*w*tp(i))-.1873*cos(6*w*tp(i))+ .1361*sin(6*w*tp(i))-.0413*cos(7*w*tp(i))+.1270*sin(7*w*tp(i))+.0178*cos(8*w*tp(i))+.0548*sin(8*w*tp(i))+.0052*cos(9*w*tp(i))+.0038*sin(9*w*tp(i))-.0216*cos(10*w*tp(i))+.0*sin(10*w*tp(i))-0.0248*cos(11*w*tp(i))+0.0180*sin(11*w*tp(i))-.0083*cos(12*w*tp(i))+0.0254*sin(12*w*tp(i))+0.0050*cos(13*w*tp(i))+0.0155*sin(13*w*tp(i))+0.0038*cos(14*w*tp(i))+0.0028*sin(14*w*tp(i))-0.0043*cos(15*w*tp(i))+.0*sin(15*w*tp(i));
%------------------------------------------%
%Distance equation approach 
% A1 = (r2^2-r1^2)-(x1(j)^2-xc1^2)-(y1(j)^2-yc1^2);
% B1 =  2*(x1(j)-xc1);
% C1 =  2*(y1(j)-yc1);
% a1 = B1^2/C1^2+1;
% b1 = 2*A1*B1/C1^2+2*y1(j)*B1/C1-2*x1(j);
% c1 = x1(j)^2 + y1(j)^2 + 2*y1(j)*A1/C1 + A1^2/C1^2 - r2^2;
% xa(i) = (-b1+sqrt(b1^2-4*a1*c1))/(2*a1);
% ya(i) = -(A1+B1*xa(i))/C1;
% %-----------------------------%
% A2 = (r2^2-r1^2)-(x1(j)^2-xc2^2)-(y1(j)^2-yc2^2);
% B2 =  2*(x1(j)-xc2);
% C2 =  2*(y1(j)-yc2);
% a2 = B2^2/C2^2+1;
% b2 = 2*A2*B2/C2^2+2*y1(j)*B2/C2-2*x1(j);
% c2 = x1(j)^2 + y1(j)^2 + 2*y1(j)*A2/C2 + A2^2/C2^2 - r2^2;
% xb(i) = (-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
% yb(i) = -(A2+B2*xb(i))/C2;
%-----------------------------%
%Triangles method approach
g1 = acos(-((xc1-x1(j))^2+(yc1-y1(j))^2-((xc2-x1(j))^2+(yc2-y1(j))^2)-((xc1-xc2)^2+(yc1-yc2)^2))/(2*sqrt(((xc2-x1(j))^2+(yc2-y1(j))^2)*((xc1-xc2)^2+(yc1-yc2)^2))));
g2 = acos(-((xc2-x1(j))^2+(yc2-y1(j))^2-((xc1-x1(j))^2+(yc1-y1(j))^2)-((xc1-xc2)^2+(yc1-yc2)^2))/(2*sqrt(((xc1-x1(j))^2+(yc1-y1(j))^2)*((xc1-xc2)^2+(yc1-yc2)^2))));
o1 = acos(-(r2^2-r1^2-((xc2-x1(j))^2+(yc2-y1(j))^2))/(2*r1*sqrt((xc2-x1(j))^2+(yc2-y1(j))^2)));
o2 = acos(-(r2^2-r1^2-((xc1-x1(j))^2+(yc1-y1(j))^2))/(2*r1*sqrt((xc1-x1(j))^2+(yc1-y1(j))^2)));
Q2(i) = -(g1+o1);
Q1(i) = -(pi-(g2+o2));
xa(i) = xc1 + r1 * cos(Q1(i));
ya(i) = yc1 + r1 * sin(Q1(i));
xb(i) = xc2 + r1 * cos(Q2(i));
yb(i) = yc2 + r1 * sin(Q2(i));
%q1(i)= atan(ya(i)/xa(i));
%q2(i) = atan(yb(i)/xb(i));
%--------------------%
plot([xc2 xb(i)],[yc2 yb(i)],'b','LineWidth',1);
plot([xb(i) x1(j)],[yb(i) y1(j)],'r','LineWidth',1);
plot([xc1 xa(i)],[yc1 ya(i)],'r','LineWidth',1);
plot([xa(i) x1(j)],[ya(i) y1(j)],'b','LineWidth',1);
%grid on;
%grid minor;
plot(x0,y0);
hold on;
axis([-16 16 -20 5]);
getframe;
cla;
i=i+1;
j=j+1;
end
subplot(2,1,1);
plot(T,x1);
grid on;
grid minor;
subplot(2,1,2);
plot(T,y1);
grid on;
grid minor;

