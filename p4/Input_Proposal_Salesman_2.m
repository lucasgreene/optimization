function out=Input_Proposal_Salesman_2(x)
% Swap order of visiting 2 adjacent random cities

i = randi(99); c_i = x(i);
j = i+1; c_j = x(j);

out = x;
out(i) = c_j; out(j) = c_i;
