:- use_module(library(pce)).
:- use_module(library(pce_style_item)).

main :-
    % Creación de la ventana principal
    new(Menu, dialog('Ventana 1', size(350, 200))),

    % Creación de un label con un mensaje
    new(L, label(nombre, 'Este es un test para cambiar entre ventanas en Prolog')),
    
    % Creación de botones
    new(Salir, button('Salir', and(message(Menu, destroy), message(Menu, free)))),
    new(BotonVentana2, button('Ventana 2', message(@prolog, ventana2))),
    
    % Colocación de elementos en la ventana principal
    send(Menu, display, L, point(10, 20)),
    send(Menu, display, BotonVentana2, point(10, 50)),
    send(Menu, display, Salir, point(10, 100)),
    
    % Abrir la ventana principal en el centro de la pantalla
    send(Menu, open_centered).


ventana2 :-
    % Creación de la ventana 2
    new(Ventana2, dialog('Ventana 2', size(300, 200))),
    
    % Creación de un label con un mensaje diferente
    new(L2, label(nombre, 'Esta es la ventana 2')),
    
    % Creación de botón para cerrar la ventana 2
    new(Salir2, button('Cerrar', and(message(Ventana2, destroy), message(Ventana2, free)))),
    
    % Colocación de elementos en la ventana 2
    send(Ventana2, display, L2, point(10, 20)),
    send(Ventana2, display, Salir2, point(10, 100)),
    
    % Abrir la ventana 2 en el centro de la pantalla
    send(Ventana2, open_centered).
