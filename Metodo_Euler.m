clc;clear;

function f=Funcion_X()
  fprintf(1, "Ingrese la funcion y' = f(t,y)\tEjemplo: 'y'=f(t,y)=-y+t+1'\n--> ");
  s=input(' ');
  f=inline(s, 'x');
endfunction

function [t w]=Euler(a,b,N, ya)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*f(t(i),w(i));
    t(i+1)=a+i*h;
  endfor
endfunction

function [t w]=PuntoMedio(a,b,N,ya)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*f(t(i)+h/2,w(i)+h*f(t(i),w(i))/2);;
    t(i+1)=a+i*h;
  endfor
endfunction

function [t w]=EulerModificado(a,b,N,ya)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*(f(t(i),w(i))+f()/2;
    t(i+1)=a+i*h;
  endfor
endfunction
  
  