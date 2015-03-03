function out=Input_Proposal_Salesman_9(x)
% Tries a 3-opt solution


i = randi(97);
j = i + randi(98-i);
k = j + randi(99-j);


one = [x(1:i) x(i+1:j) flip(x(j+1:k)) x(k+1:end)];
two = [x(1:i) flip(x(i+1:j)) x(j+1:k)  x(k+1:end)];
three = [x(1:i) flip(x(i+1:j)) flip(x(j+1:k)) x(k+1:end)];
my_cell = {one,two,three};
[~,i] = min(cellfun(@travelingSalesman,my_cell));
out = my_cell{i};
