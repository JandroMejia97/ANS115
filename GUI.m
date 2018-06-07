clc;clear;
function longitud=getLongitud(hObject)
  longitud=str2num(get(hObject,'string'));
endfunction
function gravedad=getGravedad(hObject)
  gravedad=str2num(get(hObject,'string'));
endfunction
function inferior=getInferior(hObject)
  inferior=str2num(get(hObject,'string'));
endfunction
function superior=getSuperior(hObject)
  superior=str2num(get(hObject,'string'));
endfunction

f = dialog ("name", "Ecuaci�n Deferencial No Lineal");

lblTema = uicontrol (f, "style", "text", "string", "SOLUCI�N NUM�RICA DE LA ECUACI�N DIFERENCIAL NO LINEAL QUE DESCRIBE LAS OSCILACIONES DEL P�NDULO SIMPLE ", "position",[20 370 800 80]);
lblIngresar = uicontrol (f, "style", "text", "string", "Ingresar Datos", "position",[0 360 150 40]);
lblLongitud = uicontrol (f, "style", "text", "string", "Longitud:", "position",[15 330 150 20]);
txtLongitud = uicontrol (f, "style", "edit", "position",[200 330 100 20],'tag','longitud','callback',@getLongitud);
lblGravedad = uicontrol (f, "style", "text", "string", "Gravedad:", "position",[15 300 150 20]);
txtGravedad = uicontrol (f, "style", "edit", "position",[200 300 100 20],'tag','gravedad','callback',@getGravedad);
lblInferior = uicontrol (f, "style", "text", "string", "L�mite inferior:", "position",[15 270 150 20]);
txtInferior = uicontrol (f, "style", "edit", "position",[200 270 100 20],'tag','inferior','callback',@getInferior);
lblSuperior = uicontrol (f, "style", "text", "string", "L�mite inferior:", "position",[15 240 150 20]);
txtInferior = uicontrol (f, "style", "edit", "position",[200 240 100 20],'tag','superior','callback',@getSuperior);



% create an edit control
#e1 = uicontrol (f, "style", "edit", "string", "Text", "position",[10 60 300 40]);
          % create a checkbox
lblEleccion = uicontrol (f, "style", "text", "string", "Elegir M�todo N�merico", "position",[30 190 150 40]);
gp = uibuttongroup(f,"Title","Seleccione una opcion", "position",[30 190 150 240]);
c1 = uicontrol(gp, "style", "radiobutton", "string", "M�todo de Euler", "position",[50 160 150 40]);
c2 = uicontrol(gp, "style", "radiobutton", "string", "M�todo del Punto Medio", "position",[50 130 175 40]);
c3 = uicontrol(gp, "style", "radiobutton", "string", "M�todo de Heun", "position",[50 100 150 40]);
c4 = uicontrol(gp, "style", "radiobutton", "string", "M�todo de Runge-Kutta", "position",[50 70 175 40]);
c5 = uicontrol(gp, "style", "radiobutton", "string", "Todos los anteriores", "position",[50 40 225 40]);
          % create figure without a default toolbar
          
% create a button (default style)
b1 = uicontrol (f, "string", "Resolver", "position",[80 10 150 40], "callback",@resolver);
b2 = uicontrol (f, "string", "Ver gr�ficos", "position",[250 10 150 40]);


%[T, L_X] = table (X)
%[T, Valor, Error] = table (2, 4);
%fprinf('\n ti,wi,yi=y(ti), Error')
