%% Partial Differential Equations
%  Fokker-Plank Equation
%  u_t = u_xx + x u_x + u
x = linspace(-10,10,100);
t = linspace(0, 1, 100);
m = 0;
sol = pdepe(m,@fokkerplank,@fokkerplankic,@fokkerplanckbc,x,t);
colormap hot
imagesc(x,t,sol)
colorbar
xlabel('Distance x','interpreter','latex')
ylabel('Time t','interpreter','latex')
title('Fokker-Plank Equation for $-10 \le x \le 10$ and $0 \le t \le 1$','interpreter','latex')
saveas(gcf, '../figs/E02_fp_pde.png')

function [c,f,s] = fokkerplank(x,t,u,dudx)
c = 1;
f = dudx;
s = x * dudx + u;
end

function u0 = fokkerplankic(x)
u0 = 0.5;
end

function [pl,ql,pr,qr] = fokkerplanckbc(xl,ul,xr,ur,t)
pl = 0; 
pr = 0;
ql = 1; 
qr = 1;
end
