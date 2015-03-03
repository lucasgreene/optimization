function out = tswop_prop_flip(x)
%randomly selects a pair (thigh-calf) and flips the sign
% i.e 1,1 becomes -1,-1

n = randi(numel(x)/2);
pair = [2*n (2*n-1)];

x(pair) = x(pair)*-1 ;

out = x;