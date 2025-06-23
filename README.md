# FightV Learning App

## Descripción del Proyecto

En principio, la ideación de una aplicación móvil para enseñar y aprender sobre como jugar y disfrutar de mejor manera los juegos de pelea no era algo que se pensara en principio a la hora de realizar el proyecto. Pero al investigar, existe un amplio (aunque igualmente acotado) margen de personas que se ven interesadas por este tipo de juego, pero que se ven propensas a dejar o abandonar el juego dada la complicada dificultad que existe al entrar a este tipo de juegos.
Los juegos de pelea, aunque populares en la década de los 90´s, hoy en día son casi de un nicho especifico de jugadores que intentan masterizar o aprender los más posible acerca de los mismos, para disfrutar más de ellos.
Y es que los juegos de pelea cuentan con una curva de dificultad bastante elevada, por lo que la diferencia entre no saber jugar y saber jugar es muy amplia entre jugadores, además de costosa en temas de tiempo.
Por ello es que nació la idea de esta aplicación titulada FightV Learning App, para que los usuarios de esta aplicación puedan mejorar y aprender en un tiempo menor todo lo que engloba a varios juegos de pelea incluyendo sus mecánicas, personajes, combos y demás.

---

## Características principales

Las características principales de la aplicación son sus interfaces solidas y sencillas donde entre pantallas, se puede ir accediendo a la información de manera concisa y rápida.
La aplicación cuenta con un menú principal donde se puede acceder al perfil de usuario, a los juegos favoritos y a la lista de todos los juegos, siendo este el inicio de la aplicación.
Desde el inicio el usuario podrá navegar entre los juegos disponibles para aprender, guiándose de cada uno los apartados que contiene, siendo de la siguiente manera:
Videojuego: 
    Información general: Detalles y datos acerca del juego.
    Tutorial general: Un tutorial centrado en las bases del juego.
    Personajes: Listado de cada personaje para aprender lo escencial de cada uno.
    Mis combos: Un listado de los combos realizados por el usuario o sus combos favoritos del juego.

En Tutorial generl el jugador podrá acceder a lo siguiente:
Tutorial general: 
    Movimientos: Especifica cada accion que se puede realizar en el juego enfocado principalmente en el movimiento del personaje
    Ataque: Centrado en como atacar e información sobre tecnicas de ataque, cuadros por segundos, frame traps, etc
    Defensa: Todo lo que es la defensa y como manejarla lo mejor posible para saber cuando atacar
    HUD/Interfaces: Indica todo lo que hay por pantalla como salud de los personajes, mensajes en pantalla, barras de energia, etc
    Mecanicas: Engloba todo lo que sean las mecanicas principales y secundarias del juego

Así tambien cada personaje contara con su propio apartado para aprender sobre el, contando con:
    Informacion general: Es la pantalla de inicio del personaje y donde se entregan datos y curiosidades
    Tutorial: Es un tutorial enfocado unicamente en el personaje, como usar sus movimientos, capacidades, habilidades y demás
    Movimientos: Lista todos los movimientos del personaje en cada uno de sus estados, así como los movimientos especiales tambien
    Combos: Muestra un listado de combos basicos y avanzados propuestos hacia el personaje, siendo los más conocidos, pero idelaes para entender la frame data del personaje
    Especificaciones: Un apartado extra donde se indican las mecanicas o cosas unicas del gameplay del personaje siendo un poco más enfocado en ello

## Nuevas caracteristicas

Ahora en cada apartado de los personajes (pantalla principal) hay un boton que servirá para añadir nuevos combos a ese personaje y que se guardaran en la sección de 'mis combos' para un acceso más rapido a estos.

Se cuenta tambien con una actualización del drawer del Inicio ahora con dos nuevos apartados: 'Acerca de', un apartado para conocer el proposito de la aplicación, comunicarse con el desarrollador y responder una encuesta sobre el estado de la aplicación. 'Preferencias', un apartado donde se podrán guardar 3 preferencias del usuario en cuestión (sujetas a cambios), siendo estas: activar notificaciones, compartir combos por wifi, recomendar nuevos combos.

Sumado a esto, en el drawer, tambien se incluyo un apartado superior que muestra al usuario actual en uso teniendo una imagen, el nombre del usuario y su correo.

---

## Funcionalidades destacadas

La aplicación cuenta con varias funcionalidades entre las que se encuentra principalmente poder realizar combos haciendo combinaciones de movimientos, utilizando, principalmente, la información dada de cada movimiento como frame data (información de duración de cada frame en una animación), para poder realizar cancelaciones y ejecutar combos.
Además de esto el usuario podrá contar con la personalización del perfil, añadir sus juegos favoritos a una lista de acceso rápido, así como sus combos creados y no los sugeridos por la aplicación para comenzar. 

## Nuevas funcionalidades y requerimientos

La aplicación ahora registra y mantiene datos, pudiendo registrar usuarios a la aplicación y reflejar los cambios en toda la app a excepción de la lista de videojuegos favoritos del usuario.
El apartado del perfil de usuario ahora es más sofisticado y al momento de registrar un usuario, a este se le muestran una serie de opciones las cuales son; mis juegos, soporte, acerca de, preferencias, cerrar sesión. Aunque si bien diga cerrar sesión en el botón, pasa que en realidad elimina al usuario de la base de datos, por ende no se puede recuperar por el momento.

El botón que contiene cada videojuego ahora es funcional y en la lista de videojuegos favoritos aparece sin necesidad del perfil de usuario (por el momento).

Además de la base de datos y la persistencia de estos, se aplico la funcionalidad de recibir notificaciones al momento de realizar una acción en la app, pero el llamado al permiso no esta bien configurado, por lo que para realizar una notificación, la app debe de tener el permiso desde el dispositivo de uso.

## Diagramas de Acceso a la información y flujo 



---

## 🌐 Recursos y enlaces públicos
- [Enlace a video en YouTube] 
- [Enlace a APK de la aplicación] https://github.com/Nachaor12/FightVLearningApp---DM/releases/tag/v1.2.0
- https://docs.flutter.dev/cookbook/design/tabs 
- https://docs.flutter.dev/ui/navigation 
- https://docs.flutter.dev/cookbook/design/drawer
- https://www.fightersgeneration.com/games/sf3-thirdstrike.html 
- https://www.youtube.com/watch?v=aP-MUOMCgp8 
- https://streetfighter.fandom.com/es/wiki/Street_Fighter_III:_3rd_Strike 
- https://www.youtube.com/watch?v=AGrIR_jlLno&list=TLPQMTUwNTIwMjXVqwMXsQY6Ew&index=3
- https://streetfighter.fandom.com/wiki/Akuma 
- https://pub.dev/packages/logger/install
- https://www.youtube.com/watch?v=3JAJPKjnSMs
- https://www.youtube.com/watch?v=-TWCEmG96NI
- https://www.youtube.com/watch?v=uKz8tWbMuUw
- https://www.youtube.com/watch?v=U1BErwaE3zo&t=193s
- https://pub.dev/packages/change_app_package_name/install
- https://pub.dev/packages/flutter_native_splash
- https://pub.dev/packages/flutter_local_notifications
- https://pub.dev/packages/timezone
- https://pub.dev/packages/flutter_timezone
- https://pub.dev/packages/permission_handler
- https://pub.dev/packages/android_intent_plus
- https://pub.dev/packages/sqflite
- https://pub.dev/packages/shared_preferences
- https://pub.dev/packages/provider
- https://www.youtube.com/watch?v=G1DHU3Htfdg
- https://www.youtube.com/watch?v=IauVykCvj3g
- https://pub.dev/packages/path_provider
- https://pub.dev/packages/share_plus
- https://pub.dev/packages/flutter_launcher_icons

