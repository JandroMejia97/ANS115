f = dialog ("name", "Dialog Example");

lblLongitud = uicontrol (f, "style", "text", "string", "Longitud:", "position",[15 380 150 20]);
txtLongitud = uicontrol (f, "style", "edit", "position",[100 380 100 20]);
lblGravedad = uicontrol (f, "style", "text", "string", "Gravedad:", "position",[15 350 150 20]);
txtGravedad = uicontrol (f, "style", "edit", "position",[100 350 100 20]);
lblInferior = uicontrol (f, "style", "text", "string", "Límite inferior:", "position",[15 320 150 20]);


% create a button (default style)
b1 = uicontrol (f, "string", "Button", "position",[10 10 150 40]);
% create an edit control
#e1 = uicontrol (f, "style", "edit", "string", "Text", "position",[10 60 300 40]);
          % create a checkbox
          c1 = uicontrol (f, "style", "checkbox", "string", "Checkbox", "position",[10 120 150 40]);
          % create figure without a default toolbar
          
