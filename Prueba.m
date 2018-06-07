angulo=12;
thetan=angulo*pi/180;
L=3;
g=9.8;
function f=pendu_CF(inicial,t,L,g)
  theta=inicial(1);
  omega=inicial(2);
  f=[omega;(-g/L)*sin(theta)];
endfunction
t=linspace(0,50,500);
inicial=[thetan 0];
f=pendu_CF(inicial, t,L,g);
pendu_sol=lsode(f,inicial, t);
hold on;
grid on;
plot(t, pendu_sol(0), 'b', legend='theta(t)');
plot(t, pendu_sol(1), 'g', legend='omega(t)');
grid on: