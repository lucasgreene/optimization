function out=Input_Proposal_Salesman_8(x)
% Tries a 2-opt solution


i = randi(98);
k = i + randi(99-i);
out = [x(1:i) flip(x(i+1:k)) x(k+1:end)];