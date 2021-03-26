% return shortest x y distance on torus lattice of certain size
% if bx - sx > size/2, add size to sx; same for y

%function [dx,dy] = TorusEuDist(p1,p2,size)
function dist = TorusEuDist(p1,p2)
% return shortest x y distance on torus lattice of certain size
% if bx - sx > size/2, add size to sx; same for y

% sx = min(p1(1),p2(1)); % smaller x coord
% sy = min(p1(2),p2(2)); % smaller y coord
% bx = max(p1(1),p2(1)); % bigger x coord
% by = max(p1(2),p2(2)); % bigger y coord
% 
% if bx - sx > size/2
%     nbx = sx + size;
%     nsx = bx;
% else
%     nbx = bx; nsx = sx;  
% end
% 
% if by - sy > size/2
%     nby = sy + size;
%     nsy = by;
% else
%     nby = by; nsy = sy;  
% end

p1x = p1(1);p1y = p1(2);
p2x = p2(1);p2y = p2(2);

if p1x < p2x
    x_change = 2*pi;
else x_change = -2*pi;
end

if p1y<p2y
    y_change = 2*pi;
else y_change = -2*pi;
end

pa = p1;
pb = [p1x + x_change,p1y];
pc = [p1x,p1y + y_change];
pd = [p1x+ x_change,p1y + y_change];

dist = min([pdist([p2;pa]),pdist([p2;pb]),pdist([p2;pc]),pdist([p2;pd])]);
%dx = nbx - nsx; dy = nby - nsy;
    