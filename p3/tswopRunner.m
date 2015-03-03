% tswopRunner
% Overall strategy: store 5 best runs, on each iteration randomly select
% one run to optimize. Randomoly select a proposal function to use for 
% this iteration. Run localSearch. If the optimized run is better than the
% minimum (best) value in the stored runs, the replace the maximum (worst)
% of the stored runs with this optimized run. Repeat for 1000 iterations,
% halving epsilon at the half-way mark
% The starting conditions for the 5 runs is an alternating series of 
% 10 1's followed by 10 -1's. This gives a good starting point for the 
% local search. tswop is too specific to use a fully random starting vector
% or to start a totally new vector at any point in the iteration. Rather we
% allow 5 good runs to be optimized randomly. We only update one of these
% runs when an optimized run is better than the entire set, which reduces
% homogeneity. We also allow a fairly large epsilon in localSearch, as well
% as a large timeDelta, to encourage exploration. This is necessary because
% we only store 5 runs, so it is possible that they will all settle in a 
% local max if each optmization is not sufficiently broad

% There are 4 proposal functions as follows:
% wideScaleRandomNoisePairProposal -> picks a (thigh-calf) pair and
% translates this pair in positive or negative direction
% wideScaleRandomNoiseOneCoordinateProposal -> translates one element
% tswop_prop_flip -> selects a (thigh-calf) pair, and flips the sign
% tswop_prop_scale -> takes some selection of succesive elements of
% variable size and scales these numbers. The range of size is restricted
% {0,10}.

% The general idea behind the proposal functions is changing when the
% force on one leg starts, changing the force difference
% between the calf and thigh of a pair, scaling different sections of the
% run, and changing the force between calf-thigh pairs.


close all
lowerBoundOnX = -1;
upperBoundOnX = 1;
funcToOptimize = @tswop;
timeDelta = 0.2;
funcDelta = 0.1;
epsilon = .2;
a1 = ones(1,10);
aneg1 = a1*-1;
start_x = [a1 aneg1 a1 aneg1]; % 10 1's, followed by 10 -1's
best_x = {start_x,start_x,start_x,start_x,start_x};
best_score = [tswop(best_x{1}),tswop(best_x{1}),tswop(best_x{1}),tswop(best_x{1}),tswop(best_x{1})];

num_iter = 1000;
r = rand(1,num_iter);
tic
for i = 1:num_iter
    
    if i<500
       epsilon =.2;
    else 
       epsilon = .1;
    end
    proposalFunc = @(x) tswop_proposal_pick(x); 
    X = best_x{ceil(r(i)*5)}; %pick a run to optimize
    out = localSearch(funcToOptimize,proposalFunc,X,epsilon,lowerBoundOnX,upperBoundOnX,timeDelta,funcDelta);
    score = funcToOptimize(out);
    
    [v,ind] = min(best_score);
    [v2,ind2] = max(best_score);
    if score<v %update
        best_score(ind2) = score  
        best_x{ind2} = out;
    end

end
toc
pause(.25)
best_score
