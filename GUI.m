clc;clear;

function entrada = btnResolver(editText)
  entrada(1)=str2num(get(editText(1),'string'));
  entrada(2)=str2num(get(editText(2),'string'));
  entrada(3)=str2num(get(editText(3),'string'));
  entrada(4)=str2num(get(editText(4),'string'));
  entrada(5)=str2num(get(editText(5),'string'));
  entrada(6)=str2num(get(editText(6),'string'));
  l=get(editText(7), 'selected')
  for i=1:length(editText(7))
    if get(editText(7)(i), 'selected') == "on"
      entrada(7)=get(editText(7)(i),'tag')
    end
  end
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

inputBox=[txtLongitud, txtGravedad, txtInferior, txtSuperior, txtIte, txtPuntoInicial, gp];

btn1 = uicontrol (gpp, "string", "Resolver", "position",[250 130 150 40], "callback","entrada=btnResolver(inputBox)");
btn2 = uicontrol (gpp, "string", "Ver gráficos", "position",[420 130 150 40]);

%[T, L_X] = table (X)
%[T, Valor, Error] = table (2, 4);
%fprinf('\n ti,wi,yi=y(ti), Error')