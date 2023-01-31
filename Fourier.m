w = 2*pi;
A = ones(101,1);
for c = 2:2:31;
  i=1;
for t=0:0.0001:1
    A(i,c) = cos((c)/2*w*t);
   % A(i,c) = sin((c-1)/2*w*t);
        i=i+1;
end
%  for t=0.75:0.02:1
%     A(i,c) = cos((c)/2*w*t);
%     A(i,c+1) = sin((c-1)/2*w*t);
%         i=i+1;
% end
end
