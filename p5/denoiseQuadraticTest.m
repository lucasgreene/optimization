function err=denoiseQuadraticTest(inp,k,x)
% Given parameters inp and k as in denoiseQuadratic, and a proposed
% solution x, this function computes the penalty function that you want to
% minimize, as described in the handout. DO NOT call this function as part
% of your optimization routine; instead, this function is provided to help
% you debug your code, and check whether you have the right answer.

err=k*sum(sum((x-x([2:end 1],:)).^2))+k*sum(sum((x-x(:,[2:end 1])).^2))+sum((x(:)-inp(:)).^2);