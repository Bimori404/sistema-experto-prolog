:-use_module(library(pce)). % libreria para que se muestre la interfaz
:-use_module(library(pce_style_item)).% se ocupa para estilos de letra y colores
:-pce_image_directory('./src'). % acceso a donde se tiene guardada la carpeta de la imagen
:- dynamic color/2. % Numero de colores que se utilizan

resource(pizarron, image, image('pizarron.jpg')). % instruccion para cargar la imagen en la carpeta que esta almacenada .jpg
resource(li, image, image('itsm_logo.jpg')).
resource(descripcion, image, image('descripcion.jpg')).

% variables y funciones que se utilizan para que se pueda visualizar la imagen mediante la  interfaz grafica
imagen_portada(Pantalla, Imagen) :- new(Figura, figure),
                                    new(Bitmap, bitmap(resource(Imagen),@on)),
                                    send(Bitmap, name, 1),
                                    send(Figura, display, Bitmap),
                                    send(Figura, status, 1),
                                    send(Pantalla, display,Figura,point(0,0)).

% ---------------------------------------------------------------------------------------------------------------------------------------------

inicio:- % Inicio de nuestro programa, creando el objeto de dialogo con la variable D (dialogo)

new(D,dialog('SISTEMA EXPERTO - PROLOG',size(800,2350))),% inicio de nuestra interfaz principal

% muestra texto dentro de los label
new(Label1,label(text,'-------- INSTITUTO TECNOLOGICO SUPERIOR DE EL MANTE --------')),
	send(Label1,colour,red), % sirve para poner los colores en las letras
new(Label2,label(text,' ')),
	send(Label2,colour,blue),
new(Label3,label(text,'                          -------- Test vocacional ITSM --------')),
	send(Label3,colour,blue),
new(Label4,label(text,' ')),
	send(Label4,colour,blue),

% llama a los label y los adjunta para mostrarlos en la ventana principal
imagen_portada(D, li),
send(D,append(Label1)),
send(D,append(Label2)),
send(D,append(Label3)),
send(D,append(Label4)),

% crea el boton que almacenamos en nuestra variable para la funcion que se ha programado anteriormente
new(Boton1,button('Iniciar',and(message(@prolog,principal),
and(message(D,open),message(D,free))))),
send(Boton1,colour,blue),

new(Boton2,button('Ayuda',and(message(@prolog,main1),
and(message(D,open),message(D,free))))),
send(Boton2,colour,blue),

new(Boton3,button('Carreras',and(message(@prolog,main2),
and(message(D,open),message(D,free))))),
send(Boton3,colour,blue),

new(Bcancelar,button('Salir',and(message(D,destroy),message(D,free)))),
send(Bcancelar,colour,red),

% llamada de los botones para que se muestren en la interfaz
send(D,append(Boton1)),
send(D,append(Boton2)),
send(D,append(Boton3)),
send(D,append(Bcancelar)),
send(D,open_centered).

:-inicio.

% ---------------------------------------------------------------------------------------------------------------------------------------------

% llamando a la funcion principal de nuestro boton iniciar
principal:-
	new(D2, dialog(' TEST VOCACIONAL ',size(500,400))), %inicio de nuestra interfaz emergente
	new(Label10, label(nombre,'')),send(Label10,colour,red),%color de texto de la variable D2

        imagen_portada(D2, pizarron), % carga de imagen

	new(@texto,label(text,'                                            Una vez finalizado el TEST podras ver los resultados:')),
		new(@respl,label(text,'')),
	new(Salir,button('Salir',and(message(D2,destroy),message(D2,free)))),

% creaciin del boton para dar inicio al TEST
	new(@boton,button('Da click si estas listo',message(@prolog,botones))),

	send(D2, append(Label10)),
	new(@btncarrera,button('coconut.png')), % esta linea no hace nada
        send(D2, display,Label10,point(10,20)), % mostrar el contenido de nuestra ventana
	send(D2, display,@boton,point(310,80)), % numeros ajustan las posiciones del  boton
	send(D2, display,@texto,point(50,40)),
	send(D2, display,Salir,point(340,330)),
	send(D2, display,@respl,point(90,90)),
	send(D2,open_centered). % fin de la funcion

% ---------------------------------------------------------------------------------------------------------------------------------------------

% respuesta del test
resultado('Ingenieria en sistemas computacionales'):-			sistemas_computacionales,!.
resultado('Ingenieria en innovacion agricola sustentable'):-	innovacion_agricola_sustentable,!.
resultado('Ingenieria en gestion empresarial'):-				gestion_empresarial,!.
resultado('Ingenieria industrial '):-							industrial,!.
resultado('Ingenieria quimica'):-								quimica,!.
% en caso de que su respuesta sean 'no' consecutivos
resultado('Lo sentimos, no tenemos una carrera especifica para ti').

% carrera y preguntas coreespodientes
sistemas_computacionales:-ing_sistemas_computacionales,
	consultar('Tienes buena logica?'),
	consultar('Te interesa conocer como funciona una pagina web?'),
	consultar('Eres bueno identificando problemas?'),
	consultar('Sabes lo que es un gestor de codigo? (IDE)'),
	consultar('Te interesa conocer como funciona las redes de internet?'),
	consultar('Te gusta recopilar informacion y manejarla?'),
	consultar('Consideras que eres habil al resolver problemas?'),
	consultar('Te gustan los problemas matematicos?'),
	consultar('Te interesan temas relacionados con tecnologia?'),
	consultar('Tienes facilidad para utilizar una computadora?'),
	consultar('Te consideras alguien creativo?'),
	consultar('Has utilizado algun software para diseniar?'),
	consultar('Te interesa trabajar en diferentes proyectos a la vez?'),
	consultar('Disfrutas explorando y aprendiendo sobre nuevas tecnologias?'),
	consultar('Te sientes comodo/a al enfrentarte a problemas complejos?'),
	consultar('Te sientes capaz de encontrar soluciones utilizando la logica?'),
	consultar('Te sientes comodo/a trabajando en colaboracion con otros?'),
	consultar('Eres alguien autodidacta?'),
	consultar('Te emociona la idea de estar en un campo en constante evolucion?').

innovacion_agricola_sustentable:-ing_innovacion_agricola_sustentable,
	consultar('Te atrae la idea de trabajar en un entorno que evoluciona constantemente?'),
	consultar('Te gusta aprender sobre diferentes disciplinas?'),
	consultar('Te crees capas de desarrollar soluciones para mejorar la produccion agricola?'),
	consultar('Te motiva trabajar en proyectos que busquen mejorar la eficiencia de los sistemas de riego y fertilizacion?'),
	consultar('Te atrae la idea de investigar y aplicar nuevas tecnicas para aumentar la productividad de los cultivos de manera sostenible?'),
	consultar('Crees que la aplicacion de la robotica y la automatizacion en la agricultura es clave para su desarrollo sostenible?'),
	consultar('Te interesa estudiar y aplicar motodos para reducir la merma de cultivos?'),
	consultar('Te motiva trabajar en la creacion de practicas agricolas que minimicen la contaminacion del suelo y el agua?'),
	consultar('Te motiva desarrollar proyectos que fomenten la diversificacion de cultivos para una agricultura mas resiliente?'),
	consultar('Te interesa desarrollar soluciones para la gestion eficiente de residuos agricolas?'),
	consultar('Te sientes comodo estando al aire libre?'),
	consultar('Consideras relevante trabajar en proyectos que promuevan la diversificacion genetica de cultivos locales y tradicionales?'),
	consultar('Te atrae la idea de utilizar la agroecologia como base para el disenio de sistemas agricolas sostenibles?'),
	consultar('Te interesa investigar y aplicar metodos de cultivo que minimicen el uso de pesticidas y herbicidas quimicos?'),
	consultar('Te motiva trabajar en proyectos que busquen fortalecer la resiliencia de los cultivos frente a enfermedades y plagas de forma natural?'),
	consultar('Te interesa la resolucion de problemas en diversos contextos?'),
	consultar('Te interesa la posibilidad de influir positivamente en la sociedad a traves de tu trabajo?'),
	consultar('Te interesa la idea de adaptarte a entornos laborales dinamicos?'),
	consultar('Eres paciente y perseverante ante la resolucion de problemas?').

gestion_empresarial:-ing_gestion_empresarial,
	consultar('Te interesa la gestion e inovacion de procesos?'),
	consultar('Estas interesado hacer un proyecto de inversion?'),
	consultar('Te interesa trabajar en finanzas?'),
	consultar('Buscas trabajar en logistica?'),
	consultar('Te interesa trabajar en administracion de manufactura?'),
	consultar('Quieres trabajar en el Mercadotecnia?'),
	consultar('Te gustaria trabajar en una empresa publica o privada?'),
	consultar('Eres alguien que le gusta optimizar tiempos?'),
	consultar('Estarias dispuesto a diseniar un proyecto para un negocio?'),
	consultar('Te gustaria trabajar como un gerente de compania?'),
	consultar('Eres alguien que propone soluciones creativas en problemas reales?'),
	consultar('Consideras que habilidades de pensamiento critico?'),
	consultar('Tienes intereses por el emprendimiento?'),
	consultar('Te gustaria aprender a gestionar cadenas de suministros?'),
	consultar('Has implementado estrategias de mercadotecnia?'),
	consultar('Te crees capaz de diriguir un equipo de trabajo?'),
	consultar('Te crees capaz de implentar planes en tu entorno de trabajo?'),
	consultar('Puedes gestionar la eficiencia en un proceso?'),
	consultar('Te gustaria hacer planeaciones estrategicas de las companias?').

industrial:-ing_industrial,
	consultar('Te interesa conocer algun software de simulacion?'),
	consultar('Te sientes comodo usando botas de casquillo?'),
	consultar('Te interesaria aprender sobre reparacion de maquinaria?'),
	consultar('Te has involucrado en optimizacion de sistemas de produccion?'),
	consultar('Cuentas con conocimientos de control de calidad?'),
	consultar('Sabes manejar la eficiencia y productividad en una industria?'),
	consultar('Cuentas con conocimiento del software de disenio AutoCAD?'),
	consultar('Tienes conocimientos sobre las herramientas de corte y perforacion?'),
	consultar('Eres bueno detectando problemas?'),
	consultar('Te interesaria capacitarte sobre la manipulacion de maquinaria?'),
	consultar('Te interesaria optimizar procesos?'),
	consultar('Eres eficiente en los tiempos de produccion?'),
	consultar('Cuentas con habilidad para la resolucion de problemas?'),
	consultar('Tienes habilidad para el manejo en la toma de decisiones?'),
	consultar('Tienes conocimiento sobre los equipos de seguridad?'),
	consultar('Tienes experiencia trabajando en equipo?'),
	consultar('Te capacitarias en el sector industrial?'),
	consultar('Tienes interes por aprender sobre los gastos de produccion?'),
	consultar('Tienes conocimiento sobre el sistemas de gestion de almacenes?').

quimica:-ing_quimica,
	consultar('Te sientes fascinado por la transformacion de la materia?'),
	consultar('Tienes interes en comprender como se producen las reacciones quimicas?'),
	consultar('Disfrutas resolviendo problemas matematicos y aplicandolos a situaciones practicas?'),
	consultar('Te atrae la idea de diseniar procesos para la produccion de productos quimicos?'),
	consultar('Sientes curiosidad por la investigacion y desarrollo de nuevos materiales?'),
	consultar('Te gusta trabajar en entornos de laboratorio y realizar experimentos?'),
	consultar('Tienes habilidades para analizar y resolver problemas complejos?'),
	consultar('Eres paciente y meticuloso/a al trabajar con detalles tecnicos?'),
	consultar('Te sientes atraido/a por la idea de trabajar en la industria quimica?'),
	consultar('Disfrutas planificando y organizando procesos para lograr objetivos especificos?'),
	consultar('Eres creativo/a y te gusta proponer soluciones innovadoras?'),
	consultar('Te sientes cómodo/a trabajando con tecnologia y equipos especializados?'),
	consultar('Eres capaz de visualizar procesos tridimensionales y entender su funcionamiento?'),
	consultar('Tienes habilidades para comunicar de manera efectiva resultados y propuestas?'),
	consultar('Eres capaz de trabajar en equipo y colaborar en proyectos conjuntos?'),
	consultar('Te atrae la posibilidad de trabajar en el disenio y desarrollo de productos farmaceuticos?'),
	consultar('Disfrutas de desafios constantes y te motivas a mantenerte actualizado?'),
	consultar('Disfrutas encontrar soluciones creativas para optimizar la produccion y reducir costos?'),
	consultar('Encuentras satisfaccion en descubrir patrones y conexiones en fenomenos complejos?').

% en caso de que su respuesta sean 'no' consecutivos
no_se_encontro_ninguna_carrera_adecuada_para_ti:-no_hay_una_carrera.

% preguntas iniciales
ing_sistemas_computacionales:- 			consultar('Sabes lo que es un lenguaje de programacion?'),!.
ing_innovacion_agricola_sustentable:- 	consultar('Te sientes a gusto trabajando en proyectos a largo plazo'),!.
ing_gestion_empresarial:- 				consultar('Te gustaria obtener conocimientos administrativos?'),!.
ing_industrial:- 						consultar('Tienes interes en aprender sobre la manipulacion de maquinaria?'),!.
ing_quimica:- 							consultar('Disfrutas de asignaturas como quimica, fisica y matematicas?'),!.

:-dynamic si/1,no/1. %suceptible a generar cambios entre verdadero o falso

% ---------------------------------------------------------------------------------------------------------------------------------------------

% preguntas y resultado del test
preguntar(Problema):-new(A1,dialog(' PREGUNTAS TEST VOCACIONAL ')),
	new(L9,label(texto,'Responde las siguientes preguntas')),
	new(L10,label(text,Problema)),

% crear botones para si y no
	new(Z1,button(si,and(message(A1,return,si)))),
	new(Z2,button(no,and(message(A1,return,no)))),
	send(A1,gap,size(25,25)),

% llamada de los botones y ventanas emergentes
	send(A1,append(L9)),
	send(A1,append(L10)),
	send(A1,append(Z1)),
	send(A1,append(Z2)),

	send(A1,default_button,si),
	send(A1,open_centered), get(A1,confirm,Answer),
	write(Answer), send(A1,destroy),

% confirmacion de respuesta si y no
(   (Answer==si)->assert(si(Problema)); %confirma las preguntas si es si en confirmacion y si es no erroneo
assert(no(Problema)),fail).

% cada vez que el usuario contesta una pregunta la pantalla se limpria y se vuelve a preguntar
consultar(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar:-retract(si(_)),fail.
limpiar:-retract(no(_)),fail.
limpiar.

% borrado de la ventana emergente para dar el resultado final
botones:-borrado,
	send(@boton,free),
	send(@btncarrera,free),

% resultado de la carrera elegida
resultado(Carrera),
	send(@texto, selection('                            Hemos analizado sus respuestas y la carrera mas adecuada para ti es:')),
	send(@respl,selection(Carrera)),
	new(@boton, button('Iniciar su evaluacion',message(@prolog, botones))),
	send(Menu, display,@boton,point(40,600)),       %llamando los resultados de la ventana emergente
	send(Menu, display,@btncarrera,point(20,50)),
	send(Menu, append, new(Ayuda, popup(Ayuda))),
	limpiar.

borrado:-send(@respl,selection('')). %fin del programa

% ---------------------------------------------------------------------------------------------------------------------------------------------

% guia basica
main1:-
	new(D3, dialog(' AYUDA SOBRE EL PROGRAMA ',size(500,400))),
	new(Label10, label(nombre,'')),send(Label10,colour,red),

        imagen_portada(D3, pizarron),

	new(@texto,label(text,'                                      Guia basica para saber el funcionamiento de la pagina de prolog:')),
        new(@texto1,label(text,'Este sistema esta diseniado para informar al usuario que desee saber informacion sobre el Instituto ')),
	new(@texto2,label(text,'Tecnologico Superior de El Mante, ademas de dar una orientacion sobre las carreras que ')),
        new(@texto3,label(text,'se imparten en la institucion tomando como base la toma de decisiones con respecto')),
        new(@texto31,label(text,'a los datos ingresados.')),
	new(@texto4,label(text,'Da clic en inicio y responde las preguntas que te aparecen en la interfaz')),
        new(@texto5,label(text,'Contesta las preguntas de acuerdo con las habilidades y aptitudes que consideres tengas y pongas ')),
        new(@texto6,label(text,'en practica.')),
        new(@texto7,label(text,'Despues se te mostraran tus resultados de acuerdo a la carrera que consideremos mas apta para ti')),
        new(@texto8,label(text,'y despues presian salir.')),
		new(@respl,label(text,'')),

	new(Salir,button('Salir',and(message(D3,destroy),message(D3,free)))),

	send(D3, append(Label10)),
	send(D3, display,Label10,point(10,20)),
	send(D3, display,@texto,point(50,40)),
        send(D3, display,@texto1,point(70,70)),
        send(D3, display,@texto2,point(78,82)),
        send(D3, display,@texto3,point(88,94)),
        send(D3, display,@texto31,point(98,106)),
        send(D3, display,@texto4,point(150,150)),
        send(D3, display,@texto5,point(85,200)),
        send(D3, display,@texto6,point(85,214)),
        send(D3, display,@texto7,point(85,245)),
        send(D3, display,@texto8,point(85,261)),

	send(D3, display,Salir,point(350,350)),
	
	send(D3, display,@respl,point(90,90)),
	send(D3,open_centered).
	
% ---------------------------------------------------------------------------------------------------------------------------------------------

% carreras ofertadas
main2:- 
new(D4, dialog(' CARRERAS OFERTADAS ',size(500,400))),
	new(Label11, label(nombre,'')),send(Label11,colour,red),

        imagen_portada(D4, descripcion),

send(D4,open_centered).
