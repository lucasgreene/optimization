function out=Input_Proposal_Salesman_3(x)
% Swap order of visiting 2 blocks of cities


block_size = randi(30);
index_1 = randi(30);
index_2 = block_size+index_1;

% length(index_1:index_1+block_size-1),length(1+index_2:index_2+block_size)
% index_1,index_2,block_size
first = x(index_1:index_1+block_size-1);
second = x(1+index_2:index_2+block_size);
out = x;
out(index_1:index_1+block_size-1) = second;
out(index_2+1:index_2+block_size) = first; 
