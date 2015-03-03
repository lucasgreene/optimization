function out=wideScaleRandomNoisePairProposal(x)
% Changes two random coordinates 2i-1 and 2i of x by a random amount at a 
% random scale chosen in an exponential fashion from a range at least
% [.0001,100] 

n = randi(numel(x)/2);
pair = [2*n (2*n-1)];

Radius =  10^(rand*.1);
out = x;
out(pair) = out(pair) + randn(1,2).*Radius;
