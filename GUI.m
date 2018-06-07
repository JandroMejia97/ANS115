f = dialog ("name", "Ecuación Deferencial No Lineal", "position", [250 180 825 420]);

gp1 = uibuttongroup (f, "Position", [ 0.05 0.47 0.55 0.4]);
lblTema = uicontrol (f, "style", "text", "string", "SOLUCIÓN NUMÉRICA DE LA ECUACIÓN DIFERENCIAL NO LINEAL QUE DESCRIBE LAS OSCILACIONES DEL PÉNDULO SIMPLE ", "position",[7 367 800 70]);
lblIngresar = uicontrol (gp1, "style", "text", "string", "Ingresar Datos", "position",[0 135 120 30]);
lblLongitud = uicontrol (gp1, "style", "text", "string", "Longitud:", "position",[0 95 120 22]);
txtLongitud = uicontrol (gp1, "style", "edit", "position",[125 95 80 22]);
lblGravedad = uicontrol (gp1, "style", "text", "string", "Gravedad:", "position",[0 60 120 22]);
txtGravedad = uicontrol (gp1, "style", "edit", "position",[125 60 80 22]);
lblIte = uicontrol (gp1, "style", "text", "string", "N° de iteraciones:", "position",[0 25 120 22 ]);
txtIte = uicontrol (gp1, "style", "edit", "position",[125 25 80 22 ]);
lblInferior = uicontrol (gp1, "style", "text", "string", "Límite inferior:", "position",[225 95 120 22]);
txtInferior = uicontrol (gp1, "style", "edit", "position",[350 95 80 22]);
lblSuperior = uicontrol (gp1, "style", "text", "string", "Límite superior:", "position",[225 60 120 22]);
txtSperior = uicontrol (gp1, "style", "edit", "position",[350 60 80 22]);
lblPuntoInicial = uicontrol (gp1, "style", "text", "string", "Valor inicial:", "position",[225 25 120 22]);
txtPuntoInicial = uicontrol (gp1, "style", "edit", "position",[350 25 80 22 ]);




% create an edit control
#e1 = uicontrol (f, "style", "edit", "string", "Text", "position",[10 60 300 40]);
          % create a checkbox

%c1 = uicontrol (f, "style", "radiobutton", "string", "Método de Euler", "position",[50 110 150 40]);
%c2 = uicontrol (f, "style", "radiobutton", "string", "Método del Punto Medio", "position",[250 80 175 40]);
%c3 = uicontrol (f, "style", "radiobutton", "string", "Método de Heun", "position",[50 80 150 40]);
%c4 = uicontrol (f, "style", "radiobutton", "string", "Método de Runge-Kutta", "position",[50 50 175 40]);
%c5 = uicontrol (f, "style", "radiobutton", "string", "Todos los anteriores", "position",[250 50 225 40]);


gp = uibuttongroup (f, "Position", [ 0.65 0.47 0.29 0.4]);
lblEleccion = uicontrol (gp, "style", "text", "string", "Elegir Método Númerico", "position",[20 135 150 30]);
% create a buttons in the group
b1 = uicontrol (gp, "style", "radiobutton", ...
                "string", "Método de Euler", ...
                "Position", [ 40 108 150 30 ]);
b2 = uicontrol (gp, "style", "radiobutton", ...
                "string", "Método del Punto Medio", ...
                "Position", [ 40 81 175 30 ]);
b3 = uicontrol (gp, "style", "radiobutton", ...
                "string", "Método de Heun", ...
                "Position", [ 40 54 150 30]);
b4 = uicontrol (gp, "style", "radiobutton", ...
                "string", "Método de Runge-Kutta", ...
                "Position", [ 40 27 175 30]);
b5 = uicontrol (gp, "style", "radiobutton", ...
                "string", "Todos los anteriores", ...
                "Position", [ 40 0 225 30 ]);



          % create figure without a default toolbar
          
% create a button (default style)
b1 = uicontrol (f, "string", "Resolver", "position",[250 130 150 40]);
b2 = uicontrol (f, "string", "Ver gráficos", "position",[420 130 150 40]);


%[T, L_X] = table (X)
%[T, Valor, Error] = table (2, 4);
%fprinf('\n ti,wi,yi=y(ti), Error')