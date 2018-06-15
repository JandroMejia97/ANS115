clc;clear;
warning off;

function graficar(S, t, x, lbl, lineS, m, c)
  
  
endfunction


function [t x]=exacta(gravedad, longitud, posIni, velIni, limInf, limSup)
  x0(1) = posIni; %posicion incial
  x0(2) = velIni;
  w2 = gravedad/longitud; %cuadrado de la frecuencia angular
  a = limInf; b = limSup;
  tspan = [a b];
  g=@(t,x)[x(2); -w2*sin(x(1))];
  [t,x] = ode45(g, tspan, x0);
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

function [entrada metodo]= btnResolver(varargin)
  S=varargin{3};
  entrada=str2double(get(S.txt(1:7),'string'));
  metodo = get(S.pop, {'str', 'value'});
  if (entrada(1) <=0 |entrada(2) <=0|entrada(3) <=0|entrada(4) <0|entrada(5) <=0 |entrada(6) <0 | entrada(7) < 0)
    msgbox("Las entradas no deben ser negativas ni texto","Entrada", "warn");
  else
    hold on;
    grid on;
    [tt xx]=exacta(entrada(2),entrada(1),entrada(7),entrada(6), entrada(4), entrada(5)); 
    f=@(t,w) -entrada(2)/entrada(1)*sin(w);
    grid on;
    xlabel('t')
    ylabel('\theta')
    switch metodo{1}{metodo{2}}
      case "Método de Euler"
        [t,w]=Euler(entrada(4),entrada(4),entrada(3),entrada(7),f);
        set(S.ejes, 'title', 'Método de Euler')
        plot(S.ejes, t, w, "--*r", tt, xx, "", "linestyle", "-", "marker", "x", "color", "b");
        legend("Euler", "Exacta",'location','southwest');
      case "Método del Punto Medio"
        set(S.ejes, 'title', 'Método del Punto Medio')
        [t,w]=PuntoMedio(entrada(3),entrada(4),entrada(5),entrada(6),f);
        plot(S.ejes, t, w, "linestyle","--", "marker","*", "color","r", tt, xx(:,1), "-xb");
        legend("Punto Medio", "Exacta",'location','southwest');
      case "Método de Heun"
        title("Heun");
        [t,w]=Heun(entrada(3),entrada(4),entrada(5),entrada(6),f);
        plot(S.ejes, t, w, "linestyle","--", "marker","*", "color","r", tt, xx(:,1), "", "linestyle", "-", "marker", "x", "color", "b");
        legend("Heun", "Exacta",'location','southwest');
      case "Método de Euler Modificado"
        title("Euler modificado");
        [t,w]=EulerModificado(entrada(3),entrada(4),entrada(5),entrada(6),f);
        plot(S.ejes, t, w, "linestyle","--", "marker","*", "color","r", tt, xx(:,1), "linestyle", "-", "marker", "x", "color", "b");
        legend("Euler Modificado", "Exacta",'location','southwest');
      otherwise
        title("Todos los Metodos");
        [t w1]=Euler(entrada(3),entrada(4),entrada(5),entrada(6),f);
        [t w2]=PuntoMedio(entrada(3),entrada(4),entrada(5),entrada(6),f);
        [t w3]=Heun(entrada(3),entrada(4),entrada(5),entrada(6),f);
        [t w4]=EulerModificado(entrada(3),entrada(4),entrada(5),entrada(6),f);
        plot(S.ejes, t, w1, "linestyle","--", "marker","*", "color","r",...
              t, w2, "linestyle","-", "marker","o", "color","b",...
              t, w3, "linestyle",":", "marker","*", "color","m",...
              t, w4, "linestyle","-.", "marker","d", "color","g",...
              tt, xx(:,1), "", "linestyle", "-", "marker", "x", "color", "k");
        legend("Euler", "Punto Medio", "Heun", "Euler Modificado", "Exacta",'location','southwest');
      end
      xlim("auto");
      ylim("auto");
      hold off;
      formato = '%1.0f\t%3.4f\t%3.4f\n';
      fprintf('Donde: \nE --> Euler, PM --> Punto Medio\nH --> Heun, EM --> Euler Modificado');
      %msgbox("La salida se desplegara en la consola","Salida", "warn");
      %for i=1:entrada(5)
        %if metodo{1}{metodo{2}} == "Todos los anteriores"
          %fprintf('%2.0f\t%3.4f\tE = %1.4f\tPM = %1.4f\tH = %1.4f\tEM = %3.4f\n',i, t(i), w1(i),w2(i), w3(i),w4(i));  
        %else
         % fprintf(formato,i, t(i), w(i));
        %end
  #      salida1=strcat(,salida);
        #set(editText(7),'string',salida);
      %endfor
    #set(hEdit3, 'String',[t w]);
  end
endfunction

function entrada = btnLimpiar(varargin) 
  
endfunction

S.f = figure("units","pixel",...
              "name", "Ecuación Deferencial No Lineal",...
              "position", [50 100 1200 500],...
              "numbertitle","off", "menubar","none",...
              'resize', 'off');
              
S.gpp = uipanel(S.f, "position",[0.01 0.01 0.50 0.9], "backgroundcolor","white");
S.gp1 = uipanel (S.gpp, "title","Ingresar Datos","Position", [ 0.01 0.20 0.55 0.75],"backgroundcolor","white");

S.lbl(1) = uicontrol (S.gp1, "style", "text", "string", "Longitud:", "position",[30 265 120 22],"backgroundcolor","white");
S.txt(1) = uicontrol (S.gp1, "style", "edit", "position",[185 265 80 22], 'min', 0);
S.lbl(2) = uicontrol (S.gp1, "style", "text", "string", "Gravedad:", "position",[30 225 120 22],"backgroundcolor","white");
S.txt(2) = uicontrol (S.gp1, "style", "edit", "position",[185 225 80 22], 'min', 0);
S.lbl(3) = uicontrol (S.gp1, "style", "text", "string", "N° de iteraciones:", "position",[30 185 120 22 ],"backgroundcolor","white");
S.txt(3) = uicontrol (S.gp1, "style", "edit", "position",[185 185 80 22 ], 'min', 0);
S.lbl(4) = uicontrol (S.gp1, "style", "text", "string", "Límite inferior:", "position",[30 145 120 22],"backgroundcolor","white");
S.txt(4) = uicontrol (S.gp1, "style", "edit", "position",[185 145 80 22], 'min', 0);
S.lbl(5) = uicontrol (S.gp1, "style", "text", "string", "Límite superior:", "position",[30 105 120 22],"backgroundcolor","white");
S.txt(5) = uicontrol (S.gp1, "style", "edit","position",[185 105 80 22], 'min', 0);
S.lbl(6) = uicontrol (S.gp1, "style", "text", "string", "Velocidad inicial:", "position",[30 65 120 22],"backgroundcolor","white");
S.txt(6) = uicontrol (S.gp1, "style", "edit", "position",[185 65 80 22 ], 'min', 0);
S.lbl(7) = uicontrol (S.gp1, "style", "text", "string", "Angulo inicial (radianes):", "position",[30 25 150 22],"backgroundcolor","white");
S.txt(7) = uicontrol (S.gp1, "style", "edit", "position",[185 25 80 22 ], 'min', 0);
S.lb5 = uicontrol('style','text',...
                 'unit','pix',...
                 'position',[10 480 1200 20],'backgroundcolor','w',...
                 'string', "SOLUCIÓN NUMÉRICA DE LA ECUACIÓN DIFERENCIAL NO LINEAL QUE DESCRIBE LAS OSCILACIONES DEL PÉNDULO SIMPLE",...
                 'fontsize',13);

S.gp2 = uipanel (S.gpp, "Position", [ 0.58 0.20 0.40 0.75], "title","Elegir Método Númerico","backgroundcolor","white");
% create a buttons in the group
S.pop = uicontrol(S.gp2, "style", 'pop', 'unit', 'pix',...
                  "Position", [ 40 230 150 30 ],...
                  "string", {'Elija una opcion';...
                  "Método de Euler";...
                  "Método del Punto Medio";...
                  "Método de Heun";...
                  "Método de Euler Modificado";...
                  "Todos los anteriores";});
                  

S.ejes = axes('Position',[0.55 0.10 0.40 0.8]);
S.bt(1) = uicontrol (S.gpp, "string", "Resolver", "position",[100 20 150 40], "callback",{@btnResolver, S});
S.bt(2) = uicontrol (S.gpp, "string", "Limpiar", "position",[280 20 150 40], "callback",{@btnLimpiar, S});
                  
%b1 = uicontrol (gp2, "style", "radiobutton",   , "tag","euler", ,"backgroundcolor","white");
%b2 = uicontrol (gp2, "style", "radiobutton", "string", , "Position", [ 40 100 175 30], "tag","medio", "callback","getMetodo(b2)","backgroundcolor","white");
%b3 = uicontrol (gp2, "style", "radiobutton", "string", , "Position", [ 40 70 150 30], "tag","heun", "callback","getMetodo(b3)","backgroundcolor","white");
%b4 = uicontrol (gp2, "style", "radiobutton", "string", , "Position", [ 40 40 175 30], "tag","modif", "callback","getMetodo(b4)","backgroundcolor","white");
%b5 = uicontrol (gp2, "style", "radiobutton", "string", , "Position", [ 40 10 225 30 ], "tag","todos", "callback","getMetodo(b5)","backgroundcolor","white");

%S.gp3 =  uipanel("Position", [0.05, 0.02, 0.89 0.54], "title", "Salida", "backgroundcolor","white");

