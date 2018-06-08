clc;clear;

function graficar(x, w, lbl, lineS, m, c)
  g1 = plot(t, w,lbl,"linestyle",lineS, "marker",m, "color",c);
  set(g1, 'LineWidth', 2);
  legend(lbl);
  ylabel('t');
  xlabel('w');
endfunction


function f=Funcion(l,g,ya,a)
  t(1)=a;
  w(1)=ya;
  f=[w, -(g/l)*sin(t)]
endfunction

function [t w]=Euler(a,b,N, ya,f)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*f(t(i),w(i));
    t(i+1)=a+i*h;
  endfor
endfunction

function [t w]=PuntoMedio(a,b,N,ya,f)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*f(t(i)+h/2,w(i)+h*f(t(i),w(i))/2);
    t(i+1)=a+i*h;
  endfor
endfunction

function [t w]=EulerModificado(a,b,N,ya,f)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*(f(t(i),w(i))+f(t(i-1),w(i)+h*f(t(i),w(i))))/2;
    t(i+1)=a+i*h;
  endfor
endfunction

function [t w]=Heun(a,b,N,ya,f)
  h=(b-a)/N;
  t(1)=a;
  w(1)=ya;
  for i=1:N
    w(i+1)=w(i)+h*(f(t(i),w(i))+3*f(t(i)+2*h/3,w(i)+2*h*f(t(i),w(i))/3))/4;
    t(i+1)=a+i*h;
  endfor
endfunction
  
function [entrada metodo]= btnResolver(editText, gp)
  entrada(1)=str2num(get(editText(1),'string'));
  entrada(2)=str2num(get(editText(2),'string'));
  entrada(3)=str2num(get(editText(3),'string'));
  entrada(4)=str2num(get(editText(4),'string'));
  entrada(5)=str2num(get(editText(5),'string'));
  entrada(6)=str2num(get(editText(6),'string'));
  metodo=get(get(gp,'selectedobject'),'tag')
  figure;
  hold on;
  grid on;
  f=Funcion(entrada(1),entrada(2),entrada(4),entrada(6)); 
  switch metodo
    case "euler"
      title("Euler");
      [t,w]=Euler(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w,"Euler","--","*","r");
    case "medio"
      title("Punto Medio");
      [t,w]=PuntoMedio(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w, "PuntoMedio", "-", "o", "g");
    case "heun"
      title("Huen");
      [t,w]=Heun(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w, "Heun", ":", "x", "b");
    case "modif"
      title("Euler modificado");
      [t,w]=EulerModificado(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w, "Euler Modificado", "-.","diamond","o");
    otherwise
      title("Todos los Metodos");
      [t w]=Euler(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w,"Euler","--","*","r");
      [t w]=PuntoMedio(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w, "PuntoMedio", "-", "o", "g");
      [t w]=Heun(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w, "Heun", ":", "x", "b");
      [t w]=EulerModificado(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w, "Euler Modificado", "-.","diamond","o");
    end
    hold off;
  set(hEdit3, 'String',[t w]);
endfunction

function entrada = getMetodo(h) 
  entrada=get(h,'tag');
endfunction

f = dialog ("name", "Ecuación Deferencial No Lineal", "position", [250 180 825 420]);

gpp = uibuttongroup(f, "title", "SOLUCIÓN NUMÉRICA DE LA ECUACIÓN DIFERENCIAL NO LINEAL QUE DESCRIBE LAS OSCILACIONES DEL PÉNDULO SIMPLE ", "position",[0.01 0.01 0.98 0.98]);
gp1 = uibuttongroup (gpp, "title","Ingresar Datos","Position", [ 0.05 0.47 0.55 0.4]);

lblLongitud = uicontrol (gp1, "style", "text", "string", "Longitud:", "position",[0 95 120 22]);
txtLongitud = uicontrol (gp1, "style", "edit", "position",[125 95 80 22]);
lblGravedad = uicontrol (gp1, "style", "text", "string", "Gravedad:", "position",[0 60 120 22]);
txtGravedad = uicontrol (gp1, "style", "edit", "position",[125 60 80 22]);
lblIte = uicontrol (gp1, "style", "text", "string", "N° de iteraciones:", "position",[0 25 120 22 ]);
txtIte = uicontrol (gp1, "style", "edit", "position",[125 25 80 22 ]);
lblInferior = uicontrol (gp1, "style", "text", "string", "Límite inferior:", "position",[225 95 120 22]);
txtInferior = uicontrol (gp1, "style", "edit", "position",[350 95 80 22]);
lblSuperior = uicontrol (gp1, "style", "text", "string", "Límite superior:", "position",[225 60 120 22]);
txtSuperior = uicontrol (gp1, "style", "edit","position",[350 60 80 22]);
lblPuntoInicial = uicontrol (gp1, "style", "text", "string", "Valor inicial:", "position",[225 25 120 22]);
txtPuntoInicial = uicontrol (gp1, "style", "edit", "position",[350 25 80 22 ]);

%c1 = uicontrol (f, "style", "radiobutton", "string", "Método de Euler", "position",[50 110 150 40]);
%c2 = uicontrol (f, "style", "radiobutton", "string", "Método del Punto Medio", "position",[250 80 175 40]);
%c3 = uicontrol (f, "style", "radiobutton", "string", "Método de Heun", "position",[50 80 150 40]);
%c4 = uicontrol (f, "style", "radiobutton", "string", "Método de Runge-Kutta", "position",[50 50 175 40]);
%c5 = uicontrol (f, "style", "radiobutton", "string", "Todos los anteriores", "position",[250 50 225 40]);

gp = uibuttongroup (gpp, "Position", [ 0.65 0.47 0.29 0.4], "title","Elegir Método Númerico");
% create a buttons in the group
b1 = uicontrol (gp, "style", "radiobutton", "string", "Método de Euler", "Position", [ 40 108 150 30 ], "tag","euler", "callback","getMetodo(b1)");
b2 = uicontrol (gp, "style", "radiobutton", "string", "Método del Punto Medio", "Position", [ 40 81 175 30], "tag","medio", "callback","getMetodo(b2)");
b3 = uicontrol (gp, "style", "radiobutton", "string", "Método de Heun", "Position", [ 40 54 150 30], "tag","heun", "callback","getMetodo(b3)");
b4 = uicontrol (gp, "style", "radiobutton", "string", "Método de Euler Modificado", "Position", [ 40 27 175 30], "tag","modif", "callback","getMetodo(b4)");
b5 = uicontrol (gp, "style", "radiobutton", "string", "Todos los anteriores", "Position", [ 40 0 225 30 ], "tag","todos", "callback","getMetodo(b5)");

inputBox=[txtLongitud, txtGravedad, txtInferior, txtSuperior, txtIte, txtPuntoInicial];

btn1 = uicontrol (gpp, "string", "Resolver", "position",[250 130 150 40], "callback","btnResolver(inputBox, gp)");
btn2 = uicontrol (gpp, "string", "Ver gráficos", "position",[420 130 150 40]);

hEdit = uicontrol('Style','text', 'Position',[300 20 180 100], 'String','');
%[T, L_X] = table (X)
%[T, Valor, Error] = table (2, 4);
%fprinf('\n ti,wi,yi=y(ti), Error')
