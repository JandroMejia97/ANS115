x0(1) = 12*pi/180; %posicion incial
x0(2) = 0; %velocidad inicial
gravedad = 9.8;%gravedad
longitud =  3; %logintud
w2 = gravedad/longitud; %cuadrado de la frecuencia angular

a=0; b=10;

tspan = [a b];

g=@(t,x)[x(2); -w2*sin(x(1))];
[t,x] = ode45(g, tspan, x0);

plot(t, x(:,1), 'b')
legend('Pendulo Simple', 'location', 'southwest');
grid on;
xlabel('t')
ylabel('\theta')
title('Posición angular del pendulo simple')