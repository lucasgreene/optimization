function out=Input_Proposal_circles_2(x)
% Swaps positions of 2 circles

out = x;

n = randi(numel(x)/2-1);
pair_1 = [n*2-1 n*2];

n = randi(numel(x)/2-1);
pair_2 = [n*2-1 n*2];

P_1 = out(pair_1);
P_2 = out(pair_2);

out(pair_1) = P_2;
out(pair_2) = P_1; 
