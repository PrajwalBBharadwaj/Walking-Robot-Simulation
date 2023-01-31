%This has an assumption that crank radius is 'n' 
%times the length of coupler
n = 0.55;      % 0.52 ratio of crank to coupler
x = 3.5;       % 2.5 half the distance between motors (considering crank width)
h1 = 15;       % distance of topmost point of trajectory from motors
theta = atan(h1/x) - 10*pi/180;  % max angle to which the crank rotate wrt x axis


X = x / cos(theta); % length + X is one side of the Triangle                      

M = x*tan(theta);
H = h1 - M; % H is another side of the Triangle 
syms Length
eqn = Length^2*(1-n^2) - Length*2*n*(X + H*sin(theta)) ...
       - (H^2 + X^2 + 2*H*X*sin(theta))==0;
root = solve(eqn,Length);
fprintf('************************\n');
fprintf('cr2l_Ratio\t= %f;\n',n);
max_theta = theta*180/pi;
fprintf('Max_Theta \t= %f;\n',max_theta);
L = double(root(2));
cr = double(root(2) * n);
fprintf('Length \t\t= %f;\n', L);
fprintf('Crank \t\t= %f\n', cr);

fprintf('Max Reach\t<= %f',root(2) * (1+n));
#-------------------------------------------------------------#
a = 2*x;
b = cr;
c = L;
d = L;
e = cr;

theta1 = 0; 
theta2 = 0;
theta00 = theta1*pi/180;
theta2 = theta2*pi/180;
syms alpha;
syms beta;
eqn1 = a-b*cos(theta2) - c*cos(beta)== e*cos(theta1)+d*cos(theta2);
eqn2 = a*sin(theta2)+c*sin(beta) == e*sin(theta1)+d*sin(alpha);
roots = solve(eqn1, eqn2, alpha, beta);