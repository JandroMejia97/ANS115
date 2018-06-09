clc;clear;

function graficar(t, w, lbl, lineS, m, c)
  g1 = plot(t, w,"linestyle",lineS, "marker",m, "color",c);
  set(g1, 'LineWidth', 2);
  legend([lbl]);
  ylabel('w');
  xlabel('t');
endfunction


function f=Funcion(l,g,ya,a)
  t(1)=a;
  w(1)=ya;
  f=@(t,w) -(g/l)*sin(t);
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
    t(i+1)=a+i*h;
    w(i+1)=w(i)+h*(f(t(i),w(i))+f(t(i+1),w(i)+h*f(t(i),w(i))))/2;
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
  f=figure();
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
      graficar(t, w, "Euler Modificado", "-.","d",[0.93725 0.94118 0.94510]);
    otherwise
      title("Todos los Metodos");
      [t w1]=Euler(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w1,"Euler","--","*","r");
      [t w2]=PuntoMedio(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w2, "PuntoMedio", "-", "o", "g");
      [t w3]=Heun(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w3, "Heun", ":", "x", "b");
      [t w4]=EulerModificado(entrada(3),entrada(4),entrada(5),entrada(6),f);
      graficar(t, w4, "Euler Modificado", "-.","d",[0.93725 0.94118 0.94510]);
    end
    hold off;
    formato = '%1.0f\t%3.4f\t%3.4f\n';
    fprintf('Donde: \nE --> Euler, PM --> Punto Medio\nH --> Heun, EM --> Euler Modificado');
    msgbox("La salida se desplegara en la consola","Salida", "warn");
    for i=1:entrada(5)
      if metodo == 'todos'
        fprintf('%2.0f\t%3.4f\tE = %1.4f\tPM = %1.4f\tH = %1.4f\tEM = %3.4f\n',i, t(i), w1(i),w2(i), w3(i),w4(i));  
      else
        fprintf(formato,i, t(i), w(i));
      end
#      salida1=strcat(,salida);
      #set(editText(7),'string',salida);
    endfor
  #set(hEdit3, 'String',[t w]);
endfunction

function entrada = getMetodo(h) 
  entrada=get(h,'tag');
endfunction

S.f = figure("units","pixel","name", "Ecuación Deferencial No Lineal", "position", [250 50 825 650],"numbertitle","off", "menubar","none");

gpp = uibuttongroup(S.f, "title", "SOLUCIÓN NUMÉRICA DE LA ECUACIÓN DIFERENCIAL NO LINEAL QUE DESCRIBE LAS OSCILACIONES DEL PÉNDULO SIMPLE ", "position",[0.01 0.01 0.98 0.98], "backgroundcolor","white");
gp1 = uibuttongroup (gpp, "title","Ingresar Datos","Position", [ 0.05 0.65 0.55 0.3],"backgroundcolor","white");

lblLongitud = uicontrol (gp1, "style", "text", "string", "Longitud:", "position",[0 130 120 22],"backgroundcolor","white");
txtLongitud = uicontrol (gp1, "style", "edit", "position",[125 130 80 22],"backgroundcolor","white");
lblGravedad = uicontrol (gp1, "style", "text", "string", "Gravedad:", "position",[0 95 120 22],"backgroundcolor","white");
txtGravedad = uicontrol (gp1, "style", "edit", "position",[125 95 80 22],"backgroundcolor","white");
lblIte = uicontrol (gp1, "style", "text", "string", "N° de iteraciones:", "position",[0 55 120 22 ],"backgroundcolor","white");
txtIte = uicontrol (gp1, "style", "edit", "position",[125 55 80 22 ],"backgroundcolor","white");
lblInferior = uicontrol (gp1, "style", "text", "string", "Límite inferior:", "position",[225 130 120 22],"backgroundcolor","white");
txtInferior = uicontrol (gp1, "style", "edit", "position",[350 130 80 22],"backgroundcolor","white");
lblSuperior = uicontrol (gp1, "style", "text", "string", "Límite superior:", "position",[225 95 120 22],"backgroundcolor","white");
txtSuperior = uicontrol (gp1, "style", "edit","position",[350 95 80 22],"backgroundcolor","white");
lblPuntoInicial = uicontrol (gp1, "style", "text", "string", "Valor inicial:", "position",[225 55 120 22],"backgroundcolor","white");
txtPuntoInicial = uicontrol (gp1, "style", "edit", "position",[350 55 80 22 ],"backgroundcolor","white");

gp = uibuttongroup (gpp, "Position", [ 0.65 0.65 0.29 0.3], "title","Elegir Método Númerico","backgroundcolor","white");
% create a buttons in the group
b1 = uicontrol (gp, "style", "radiobutton", "string", "Método de Euler", "Position", [ 40 130 150 30 ], "tag","euler", "callback","getMetodo(b1)","backgroundcolor","white");
b2 = uicontrol (gp, "style", "radiobutton", "string", "Método del Punto Medio", "Position", [ 40 100 175 30], "tag","medio", "callback","getMetodo(b2)","backgroundcolor","white");
b3 = uicontrol (gp, "style", "radiobutton", "string", "Método de Heun", "Position", [ 40 70 150 30], "tag","heun", "callback","getMetodo(b3)","backgroundcolor","white");
b4 = uicontrol (gp, "style", "radiobutton", "string", "Método de Euler Modificado", "Position", [ 40 40 175 30], "tag","modif", "callback","getMetodo(b4)","backgroundcolor","white");
b5 = uicontrol (gp, "style", "radiobutton", "string", "Todos los anteriores", "Position", [ 40 10 225 30 ], "tag","todos", "callback","getMetodo(b5)","backgroundcolor","white");

gp2 =  uibuttongroup(gpp, "Position", [0.05, 0.01, 0.89 0.55], "title", "Salida","backgroundcolor","white");
#txtOut = uicontrol(gp2,"style","edit", "Position",[5 15 700 150],"enable" , "off");

inputBox=[txtLongitud, txtGravedad, txtInferior, txtSuperior, txtIte, txtPuntoInicial];

S.ejes = axes('Position',[0.57 0.1 0.4 0.7]);

btn1 = uicontrol (gpp, "string", "Resolver", "position",[250 350 150 40], "callback","btnResolver(inputBox, gp);");
btn2 = uicontrol (gpp, "string", "Ver gráficos", "position",[420 350 150 40]);

%[T, L_X] = table (X)
%[T, Valor, Error] = table (2, 4);
%fprinf('\n ti,wi,yi=y(ti), Error') 