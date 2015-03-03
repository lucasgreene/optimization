function out=wideScaleRandomNoisePairProposal(x)
% Changes two random coordinates 2i-1 and 2i of x by a random amount at a 
% random scale chosen in an exponential fashion from a range at least
% [.0001,100] 

%assuming pairs are 1,2 3,4 5,6
n = randi(numel(x)/2-1);
pair = [n*2-1 n*2];

Radius =  10^(rand()*3);
out = x;
out(pair) = out(pair) + randn(1,2).*Radius;
