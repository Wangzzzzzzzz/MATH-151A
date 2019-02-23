% MATH 151A 
% Homework 3, Question
% Wang, Zheng (404855295)

%% input vector:
x = input('Please input a vector of x_i (e.g. [1 2 3]):\n');
y = input('Please input a vector of f(x_i) (e.g. [0 1 0]): \n');
if size(x,2) ~= size(y,2)
    error('x and y must be of same length!')
end

%% input a
a = input('Please input value of a:');

%% calculation and output
fprintf('P(a) = %12.8f\n',eval_lag_poly(x,y,a))

%% Function Toolbox
function fx = eval_lag_poly(x, y, a)
    x = x';
    y = y';
    n = size(x,1);
    X = repmat(x,1,n);
    for j=1:n
        X(:,j) = X(:,j).^(j-1);
    end
    coef = X\y;
    A = repmat(a, 1, n);
    for i=1:n
        A(:,i) = A(:,i).^(i-1);
    end
    fx = A*coef;
end
