clear all
p = .75;
i=1;
for t = 0:0.02:1
     T(i)=t;
    t = mod(t,1);   
    if t<=0.75
    x(i)= 19.401 - 160*t;
    y(i)= -18;
    else
    x(i) = -100.599 - 16*(t-p)+1920.128009*(t-p)^2-0.512034135*(t-p)^3;
    y(i) = -18 + 0 + 896*(t-p)^2 - 7168*(t-p)^3 + 14336*(t-p)^4;
    end
    i=i+1;
    
end
plot(x,y);