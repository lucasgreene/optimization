function out=Input_Proposal_Salesman_1(x)
% Swap order of visiting 2 totally random cities

i = randi(100); c_i = x(i);
j = randi(100); c_j = x(j);

out = x;
out(i) = c_j; out(j) = c_i;
