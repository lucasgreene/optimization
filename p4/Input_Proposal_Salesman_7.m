function out=Input_Proposal_Salesman_7(x)
% Flips order of a block


index_1 = randi(96);
r = randi(4);
out = x;
out(index_1:index_1+r) = flip(out(index_1:index_1+r));