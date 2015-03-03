%Comments Section

%I opted not to use random restarts for this optimization; in practice they
%were time consuming and not particularly helpful. In addition, the nature of the
%Traveling Salesman problem means that randomly chosen configurations will
%usually be much, much worse than even slightly optimized configurations. 

%However, the TSP does have a good deal of local minima, so I keep track of
%the 5 most recently found best paths. This helps my function mitigate the damage done by local
%minima as it approached the optimum. 

%My general strategy is to randomly choose a proposal function and then run
%local search starting with that function and one of the top 5 best city orderings
%found so far. In order to encourage exploration early on and slow down the 
%exploration later, I start with a large epsilon value that decreases with the 
%number of iterations (somewhat like simulated annealing). 

%I wrote almost 10 different proposal functions for this problem, but I
%eventually settled on 3 to use. Input_Proposal_Salesman_1 is a simple
%heuristic that swaps two cities' positions as random. Input_Proposal_Salesman_8
%performs a 2-opt: it randomly selects 2 edges such that the sequence of cities can
%be split into blocks A,B,C and switches the edges by reversing the order
%of block B. This method preserves the ordering of the blocks, and
%therefore preserves progress. In addition, this method can significantly improve
%performance by "unwinding" edges that cross over one another. Finally,
%Input_Proposal_Salesman_9 performs 3 possible 3-opts (the same procedure
%with 3-edges) and selects the one that yields the best configuration. 





tic
close all
lowerBoundOnX = -inf;
upperBoundOnX = inf;
funcToOptimize = @travelingSalesman;
timeDelta = 0.01;
num_iter = 10000;
f_bad = {@Input_Proposal_Salesman_1,@Input_Proposal_Salesman_2,@Input_Proposal_Salesman_6,@Input_Proposal_Salesman_7};
f_good = {@Input_Proposal_Salesman_8,@Input_Proposal_Salesman_9};
Best_Vals = [inf,inf,inf,inf,inf];
Best_Xs = {randperm(100),randperm(100),randperm(100),randperm(100),randperm(100)};
ind = 1;
for i = 1:num_iter
    c_i = randi(length(Best_Xs));
    startingX = Best_Xs{c_i};
    funcDelta = 1;
    epsilon = rand()*num_iter/i;
    %Choose Proposal
    if rand() > 0.2
        proposalFunc = f_good{randi(length(f_good))};
    else
        proposalFunc = f_bad{randi(length(f_bad))};
    end
    out = localSearch(funcToOptimize,proposalFunc,startingX,epsilon,lowerBoundOnX,upperBoundOnX,timeDelta,funcDelta);
    score = funcToOptimize(out);
    %If this is an improvement on the previous value
    if score<Best_Vals(c_i)
        Best_Xs{ind} = out;
        Best_Vals(ind) = score
        %The maximum value and its index
        [m, ind] = max(Best_Vals);
    end
end


[m i] = min(Best_Vals);
best_x = Best_Xs{i};
funcToOptimize(best_x)
toc