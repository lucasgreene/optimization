function out=Input_Proposal_Salesman_5(x)
% Shuffles everything inside of blocks


index_1 = randi(90);
index_2 = index_1+randi(10);
i = index_1 + randperm(index_2-index_1-1);
out = x;
out(index_1+1:index_2-1) = out(i);

