function out=wideScaleRandomNoiseMix3Proposal(x)
% Runs a random one of the three wideScaleRandomNoise proposal functions on
% the input

array = {@wideScaleRandomNoisePairProposal,@wideScaleRandomNoiseOneCoordinateProposal,@wideScaleRandomNoiseProposal};
f = array{randi(3)};
out = f(x);