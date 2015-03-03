function out = tswop_proposal_pick(x)
%Randomly selects other proposal functions

proposals = {@wideScaleRandomNoisePairProposal,
             @wideScaleRandomNoiseOneCoordinateProposal,
             @tswop_prop_flip
             @tswop_prop_scale} ;

select = proposals{randi(numel(proposals))};
out = select(x);   