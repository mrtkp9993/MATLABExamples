%%
%   Some optimization examples
%   Functions are taken from
%   https://www.wikiwand.com/en/Test_functions_for_optimization
clear all
clc
options = optimset('Display','iter'); % Display iterations

%   Ackley func.
%   Global min at (0,0)
[x, y] = meshgrid(-5:0.01:5, -5:0.01:5);
z = -20 * exp(-0.2 * sqrt(0.5 * ( x .^ 2 + y .^ 2))) ... 
                - exp(0.5 * (cos(2 * pi * x) + cos(2 * pi * y))) ...
                + exp(1) + 20;
c = x.*y; % colors

p = surf(x, y, z, c);
set(p, 'LineStyle', 'none')
colorbar
xlabel('x')
ylabel('y')
zlabel('z')
title('Ackley Function')
saveas(gcf, '../figs/e01_opt_ackley.png')
