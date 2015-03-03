function out=Input_Proposal_Salesman_6(x)
% Shuffles everything inside of a small 4 element block


index_1 = randi(96);
i = index_1 + randperm(4);
out = x;
out(index_1+1:index_1+4) = out(i);
