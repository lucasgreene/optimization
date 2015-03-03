Code written for class. Note: some code was given to us.


There are 5 problems we solved using local search and random restarts. 


In the folder Best_values are matlab data that stores the output of the best runs of the optimization. As an example of how the various code scripts work check out the script:


tswopRunner in /p3, which simulates a person (taylor swift) running in a straight line by optimizing the timing and force used by each of her legs. The tswopRunner code calls the various proposal functions and gives them to localSearch. To see the best run in action, load besttswop in MATLAB (it will probably load to variable x), and then run tswop(x)
