function out = tswop_prop_scale(x)
% randomly scales a section of values by a number between {0.5,1}
% the size of the section is a number between {1,10}
scale = rand/2+.5;
nums = randi(numel(x)/4,[1,2]);
low = min(nums);
high = max(nums);

x(low:high) = x(low:high)*scale;
out = x;