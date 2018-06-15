x0=zeros(1,2);
x0(1)=pi/6;  %posición inicial
x0(2)=0;  %velocidad inicial
m=2; %relación M/m (plataforma/péndulo)
w2=9.8/1.0; %cuadrado de la frecuencia angular del péndulo simple

%péndulo móvil
f=@(t,x) [x(2);-(w2*(m+1)*sin(x(1))+sin(2*x(1))*x(2)/2)/(m+sin(x(1))^2)]; 
tspan=[0 3];
[t,x]=ode45(f,tspan,x0);

%péndulo fijo
g=@(t,x) [x(2);-w2*sin(x(1))]; 
[tt,xx]=ode45(g,tspan,x0);

plot(t,x(:,1),'r',tt,xx(:,1),'b')
legend('péndulo móvil','fijo', 'location','southwest')
grid on
xlabel('t')
ylabel('\theta');
title('Posición angular del péndulo')

figure 
y=-sin(x(:,1))/(1+m);
plot(t,y,'r')
grid on
xlabel('t')
ylabel('x');
title('Posición de la plataforma')