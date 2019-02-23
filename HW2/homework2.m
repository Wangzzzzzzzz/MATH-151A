% % MATH 151A HOMEWORK 2
% % QUESTION 4
% % Wang, Zheng (404855295)
% % Results are recorded in homework2.pdf

%% (a) plot the graph
figure;
fplot(@f, [-1,1]);
xlabel('x');
ylabel('y');
title('Plot of f(x) = |x|');
grid on;

%% (b) Plot 
sequence(5)
figure;
fplot(@f, [-1,1],'Linewidth', 1.1);
hold on;

for g=2:5
    [fx,x] = plt_seq(solv(sequence(g),f(sequence(g))));
    plot(fx,x,'Linewidth', 1.1)
end

xlabel('x');
ylabel('y');
legend({'f(x)','g_2(x)', 'g_3(x)','g_4(x)','g_5(x)'},'Location','southeast')
title('Plot of f, and g_2 to g_5');
grid on;
hold off;

%% (c) sequence of g_n
result = ones(1,20);
for n=1:20
    result(1,n) = eval_func( solv(sequence(n),f(sequence(n))) );
end

figure;
plot(1:20, result, 'o-', 'Linewidth', 1.1);
xlabel('n');
ylabel('g_n(0.3)');
title('Sequence of \{g_n(0.3)\}');
grid on;

%% Function declaration
function y = f(x)
    y = abs(x);
end

function x_nk = sequence(n)
    x_nk_t = ones(n+1,1);
    for k=0:n
        x_nk_t(k+1,1) = -1 + (2*k)/n;
    end
    x_nk = x_nk_t;
end

function coef = solv(x, y)
    n = size(x,1);
    X = repmat(x,1,n);
    for j=1:n
        X(:,j) = X(:,j).^(j-1);
    end
    coef = X\y;
end

function [x, fx] = plt_seq(coef)
    x = sequence(500);
    degree = size(coef,1);
    X = repmat(x,1,degree);
    for i=1:degree
        X(:,i) = X(:,i).^(i-1);
    end
    fx = X*coef;
    x = x';
    fx = fx';
end

function fx = eval_func(coef)
    x = 0.3;
    degree = size(coef,1);
    X = repmat(x,1,degree);
    for i=1:degree
        X(:,i) = X(:,i).^(i-1);
    end
    fx = X*coef;
end