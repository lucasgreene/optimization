function out=Input_Proposal_circles_1(x,magnitude)
% Changes two random coordinates 2i-1 and 2i of x by a small amount 

n = randi(numel(x)/2-1);
pair = [n*2-1 n*2];

Radius =  10^(rand()*magnitude);
out = x;
out(pair) = out(pair) + randn(1,2).*Radius;
