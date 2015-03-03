%Explanation Section:
%This code runs an augmented random restart local search. It runs local_search
%many times, and tries to balence "exploiting" previously found minima
%solutions and "exploring" new solutions. In the beginning, we explore
%more, but as the iterations progress, we exploit more. 

%When we "exploit," we resubmit previously discovered "minima" into local search with a new set of
%parameters. In particular, we decrease epsilon and funcDelta, and we use a 
%proposal function that changes the input x by a smaller amount in order to
%prioritize improvement and minimize tolerance for flowing too far off
%track.

%When we "explore", we use a random start state, and also randomize epsilon 
%and funcDelta, in order to get a wide range of different solutions and 
%completely explore the state space. In addition, we use a proposal
%function that changes the input x by a larger amount in order to
%prioritize aggressive exploration. 




close all
lowerBoundOnX = -30;
upperBoundOnX = 30;
funcToOptimize = @arrangeCircles;
timeDelta = 0.01;
best_score = 1000;
best_x = [];
%100 iterations of random restart
num_iter = 8000;
tic
for i = 1:num_iter
    %"Exploiting"
    if rand() < (2*i)/(num_iter) && numel(best_x)==20
        proposalFunc = @(x) Input_Proposal_circles_1(x,1); %smaller exploration
        if rand() > 0.5
            %Swap circles Proposal
            proposalFunc = @Input_Proposal_circles_2;
        end
        startingX = best_x;
        funcDelta = 0.05;
        epsilon = rand()*5;
    %"Exploring"
    else
        proposalFunc = @(x) Input_Proposal_circles_1(x,1.3); %larger exploitation
        funcDelta = rand()*15;
        epsilon = randi(40);
        startingX = rand(1,20)*2*upperBoundOnX - upperBoundOnX;
    end
    out = localSearch(funcToOptimize,proposalFunc,startingX,epsilon,lowerBoundOnX,upperBoundOnX,timeDelta,funcDelta);
    score = funcToOptimize(out);
    if score<best_score
        best_score = score
        best_x = out;
    end
end
toc
pause(.25)
best_score
funcToOptimize(best_x)