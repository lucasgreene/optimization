function x=denoiseQuadratic(inp,k)
% Given an input image inp, and a scaling factor k, returns the optimal
% quadratic denoising of the image, as specified in the handout

s = size(inp);
A_f = fft2(inp);
H = zeros(s); H(1,1:2) = [1 -1]; H_f = fft2(H);
V = zeros(s); V(1:2,1) = [1; -1]; V_f = fft2(V); 

X_f = zeros(s);
for i = 1:s(1)
    for j = 1:s(2)
        %We can do this element by element!
        X_f(i,j) = A_f(i,j)/(1 + k*abs(H_f(i,j))^2 + k*abs(V_f(i,j))^2);
    end 
end
x = real(ifft2(X_f));