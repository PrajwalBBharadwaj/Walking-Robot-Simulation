%clear all
dc = .5;
w =2*pi;
stroke = 1;
xc1 = +2.5;
xc2 = -2.5;
yc1 =0;
yc2=0;
r1 = 10;
r2 = 20;
ph =0.5;
dt  = 0.5;
T1 = 0.5+ph;
T2 = 30+ph;
dt1 = 0.025;
j=1;
T=1;
a3 = (-4*(stroke/2+stroke/dc*dt1)-2*stroke/dc*(T-dc-2*dt1))/(T-dc-2*dt1)^3;
a2 = -3/2*a3*(T-dc-2*dt1);
a1 = -stroke/dc;
a0 = -(stroke/2+stroke/dc*dt1);
i=1;
for t = ph:0.001:30+ph
    Time(i)=t;
   % if t>=0
    if t<T1
         tp(i)= Time(1);
    elseif t<T1+dt
         tp(i)=(t-T1)^2/(2*dt)+Time(1); 
    elseif t<T2-dt
         tp(i)= t - (T1+dt/2)+Time(1);
    elseif t<T2
         tp(i) = T2-T1-T2^2/(2*dt)-dt+T2*t/dt-t^2/(2*dt)+Time(1);
    else tp(i)= T2-T1-dt1;     
    end
%    else
%         if t<=(-T2)
%          tp(i)= T2-T1-dt1;
%     elseif t<-T2+dt1
%          tp(i)= T2-T1-T2^2/(2*dt1)-dt1+T2*t/dt1-t^2/(2*dt1);
%     elseif t<-T1-dt1
%          tp(i)= t - (T1+dt1/2);
%     elseif t<T1
%          tp(i) = (t-T1)^2/(2*dt1);
%     else tp(i)= 0;     
%         end
%     end
        
    tp(i) = mod(-tp(i),1)+floor(tp(i));%Caution!! tp is reversed
    
    if mod(tp(i),1)<=(dc+dt1)
    x(i)= stroke/2  + stroke/dc*(- mod(tp(i),1));
    elseif mod(tp(i),1)<=(T-dt1)
    x(i) = a0  + a1*( mod(tp(i),1)-(dc+dt1)) + a2*( mod(tp(i),1)-(dc+dt1))^2 + a3*( mod(tp(i),1)-(dc+dt1))^3;
    else
    x(i)= stroke/2 + stroke/dc*(T- mod(tp(i),1));    
    end
    if mod(tp(i),1)<=dc
    y(i)= -18;
    else
    y(i) = -18 + 0 + 56/(T-dc)^2*( mod(tp(i),1)-dc)^2 - 112/(T-dc)^3*( mod(tp(i),1)-dc)^3 +  56/(T-dc)^4*( mod(tp(i),1)-dc)^4;
    end
    %x1(j) = 0.00+ 2.7446*cos(w*tp(i))+ 3.7777*sin(w*tp(i))+ 2.0750*cos(2*w*tp(i))+.6742*sin(2*w*tp(i))+1.2319*cos(3*w*tp(i)) -.4003*sin(3*w*tp(i))+.4819*cos(4*w*tp(i))-.6634*sin(4*w*tp(i))-.0001*cos(5*w*tp(i))-.5197*sin(5*w*tp(i))-.1862*cos(6*w*tp(i))-.2562*sin(6*w*tp(i))-.1682*cos(7*w*tp(i))-.0546*sin(7*w*tp(i))-.0783*cos(8*w*tp(i))+.0254*sin(8*w*tp(i))-.0127*cos(9*w*tp(i))-.0175*sin(9*w*tp(i))-.0*cos(10*w*tp(i))-.0137*sin(10*w*tp(i))-.0178*cos(11*w*tp(i))-.0245*sin(11*w*tp(i))-.0324*cos(12*w*tp(i))-.0105*sin(12*w*tp(i))-0.0283*cos(13*w*tp(i))+.00092*sin(13*w*tp(i))-0.0125*cos(14*w*tp(i))-0.0172*sin(14*w*tp(i));%-0.0*cos(15*w*tp(i))+.0116*sin(15*w*tp(i));
    %y1(j) = -17.6267+ 0.5872*cos(w*tp(i)) - .4266*sin(w*tp(i)) + 0.2058*cos(2*w*tp(i)) -.6335*sin(2*w*tp(i)) - 0.1777*cos(3*w*tp(i)) - .5468*sin(3*w*tp(i))-.3750*cos(4*w*tp(i))- 0.2725*sin(4*w*tp(i))-.3450*cos(5*w*tp(i))-.0*sin(5*w*tp(i))-.1873*cos(6*w*tp(i))+ .1361*sin(6*w*tp(i))-.0413*cos(7*w*tp(i))+.1270*sin(7*w*tp(i))+.0178*cos(8*w*tp(i))+.0548*sin(8*w*tp(i))+.0052*cos(9*w*tp(i))+.0038*sin(9*w*tp(i))-.0216*cos(10*w*tp(i))+.0*sin(10*w*tp(i))-0.0248*cos(11*w*tp(i))+0.0180*sin(11*w*tp(i))-.0083*cos(12*w*tp(i))+0.0254*sin(12*w*tp(i))+0.0050*cos(13*w*tp(i))+0.0155*sin(13*w*tp(i))+0.0038*cos(14*w*tp(i))+0.0028*sin(14*w*tp(i));%-0.0043*cos(15*w*tp(i))+.0*sin(15*w*tp(i));
   
g1 = acos(-((xc1-x(i))^2+(yc1-y(i))^2-((xc2-x(i))^2+(yc2-y(i))^2)-((xc1-xc2)^2+(yc1-yc2)^2))/(2*sqrt(((xc2-x(i))^2+(yc2-y(i))^2)*((xc1-xc2)^2+(yc1-yc2)^2))));
g2 = acos(-((xc2-x(i))^2+(yc2-y(i))^2-((xc1-x(i))^2+(yc1-y(i))^2)-((xc1-xc2)^2+(yc1-yc2)^2))/(2*sqrt(((xc1-x(i))^2+(yc1-y(i))^2)*((xc1-xc2)^2+(yc1-yc2)^2))));
o1 = acos(-(r2^2-r1^2-((xc2-x(i))^2+(yc2-y(i))^2))/(2*r1*sqrt((xc2-x(i))^2+(yc2-y(i))^2)));
o2 = acos(-(r2^2-r1^2-((xc1-x(i))^2+(yc1-y(i))^2))/(2*r1*sqrt((xc1-x(i))^2+(yc1-y(i))^2)));
Q2(i) = -(g1+o1);
Q1(i) = -(pi-(g2+o2));
    i=i+1;
    j=j+1;
end
plot(x,y);
grid on;
grid minor;
%axis([-7 7 -20 -10]);