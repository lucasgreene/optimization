function out=wideScaleRandomNoiseOneCoordinateProposal(x)
% Changes a random coordinate of x by a random amount at a random scale
% chosen in an exponential fashion from a range at least [.0001,100]

el = randi(numel(x));

Radius =  10^(rand*.1);
out = x;
out(el) = out(el) + randn().*Radius;
