% Math 151A
% Homework 4
% Question 3(a)
% Wang, Zheng (404855295)
%% input N
N = input('Please input the number of subintervals, N:');
if mod(N,2) ~= 0
    error('To use Composite Simpson''s Rule, N must be even.')
end

%% calculate the output
fprintf('Estimating by Composite Simpson''s Rule...\n')
fprintf('Integral of cos(x) from 0 to pi is %12.12f\n',compos_Simps(N))

%% useful functions

function fx = f(x)
    fx = cos(x);
end

function res=compos_Simps(N)
    a = 0;
    b = pi;
    h = (b-a)/N;
    f_t = 0;
    for j=1:(N/2)
        f_t = f_t + ( f(a+(2*j-2)*h) + 4*f(a+(2*j-1)*h) + f(a+(2*j)*h) );
    end
    res = h*f_t/3;
end