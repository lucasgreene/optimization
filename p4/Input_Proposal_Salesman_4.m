function out=Input_Proposal_Salesman_4(x)
% Shuffles everything inside of blocks


index_1 = randi(70);
index_2 = index_1+randi(30);
i = index_1 + randperm(index_2-index_1-1);
out = x;
out(index_1+1:index_2-1) = out(i);

