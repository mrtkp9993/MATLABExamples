%%
%   Some optimization examples
%   Functions are taken from
%   https://www.wikiwand.com/en/Test_functions_for_optimization
clear all
clc
options = optimset('Display','iter'); % Display iterations

%%  Ackley func.
%   Global min at (0,0)
f = @(x,y) -20 * exp(-0.2 * sqrt(0.5 * ( x .^ 2 + y .^ 2))) ... 
                - exp(0.5 * (cos(2 * pi .* x) + cos(2 * pi .* y))) ...
                + exp(1) + 20;
            
fsurf(f,[-5,5],'ShowContours','on')
colorbar
xlabel('x')
ylabel('y')
zlabel('z')
title('Ackley Function')
saveas(gcf, '../figs/e01_opt_ackley.png')

fun = @(x) f(x(1),x(2));
x0 = [1, 1]; % initial guess
[x, fval, exitflag, output] = fminunc(fun,x0,options);
uncx = x
uncf = fval

%% Himmelblau's function
%  Global min at f( 3.00,  2.00) = 0
%                f(-2.80,  3.13) = 0
%                f(-3.77, -3.28) = 0
%                f( 3.58, -1.84) = 0
f = @(x,y) (x ^ 2 + y - 11) ^ 2 + (x + y ^ 2 - 7) ^ 2;

fsurf(f, [-6,6], 'ShowContours', 'on')
colorbar
xlabel('x')
ylabel('y')
zlabel('z')
title("Himmelblau's function")
saveas(gcf, '../figs/e02_opt_himmelblau.png')

fun = @(x) f(x(1),x(2));
x0 = [1, 1]; % initial guess
[x, fval, exitflag, output] = fminunc(fun,x0,options);
uncx = x
uncf = fval
