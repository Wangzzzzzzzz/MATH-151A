% Math 151A
% Homework 4
% Question 3(a)
% Wang, Zheng
%% input N
N = input('Please input the number of subintervals, N:');

%% calculate the output
fprintf('Estimating by Composite Trapezoidal Rule...\n')
fprintf('Integral of cos(x) from 0 to pi is %12.12f\n',compos_Trape(N))

%% useful functions
function fx = f(x)
    fx = cos(x);
end

function res=compos_Trape(N)
    a = 0;
    b = pi;
    h = (b-a)/N;
    fa = f(a);
    fb = f(b);
    fo = 0;
    for j=1:(N-1)
       fo = fo + 2*f(a+j*h);
    end
    res = h*(fo+fa+fb)/2;
end
