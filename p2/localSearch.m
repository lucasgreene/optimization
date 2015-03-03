function x=localSearch(funcToOptimize,proposalFunc,startingX,epsilon,lowerBoundOnX,upperBoundOnX,timeDelta,funcDelta)
% This general-purpose optimization routine aims to minimize funcToOptimize
% starting from the initial guess startingX, via proposals generated by
% proposalFunc (the two functions are specified via function handles). When
% optimizing a function whose inputs have lower and upper bounds, the
% proposal xp=proposalFunc(x) has all of its entries that are less than
% lowerBoundOnX rounded up to lowerBoundOnX, and all of its entries greater
% than upperBoundOnX rounded down to upperBoundOnX before funcToOptimize is
% evaluated on xp (these bounds can be -inf and +inf to make them effectively 
% ignored). The proposal is accepted if it improves the function value, or does
% not make it worse by more than epsilon. The routine terminates when timeDelta
% seconds have passed without the best value found so far of funcToOptimize
% improving by funcDelta.

x = startingX;
best_val = funcToOptimize(x);
val = best_val;
t1 = now*60*60*24;

while now*60*60*24 - t1 < timeDelta
    %Generate Candidate
    candidate = proposalFunc(x);
    %Round Entries
    candidate(candidate<lowerBoundOnX) = lowerBoundOnX;
    candidate(candidate>upperBoundOnX) = upperBoundOnX;
    c_val = funcToOptimize(candidate);
    if c_val<=(val+epsilon)
        x = candidate;
        val = c_val;
        if best_val - val > funcDelta
            %reset counter
            t1 = now*60*60*24;
        end
        best_val = min(val,best_val);
    end
end
