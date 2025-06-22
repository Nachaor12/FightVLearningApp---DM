import 'package:flutter/widgets.dart';
import 'package:fightvlearning_app/entity/character.dart';

class Videogame {
  int id; //id de juego para ser encontrado más rapido
  String name; //Nombre del juego/identificador
  ImageProvider image; //Imagen/logo del juego
  List<ImageProvider> listButtonsPages;
  //ImageProvider imageInfo; //Imagenes de los botones de la pantalla game_page
  //ImageProvider imageTutorial; 
  //ImageProvider imageCharacters;
  //ImageProvider imageMyCombos;
  int released; //Año de lanzamiento
  String developer; //Desarrolladora
  bool favorite; //Si es favorito del usuario
  Icon icon; //Icono de favorito
  String description; //Una descripcion del juego en general
  List<String> listTutorial;
  List<Character> listCharacters; //Lista de personajes que contempla el juego

  Videogame({
    required this.id,
    required this.name, 
    required this.image,
    required this.listButtonsPages,
    //required this.imageInfo,
    //required this.imageTutorial,
    //required this.imageCharacters,
    //required this.imageMyCombos,
    required this.released, 
    required this.developer, 
    required this.favorite,
    required this.icon, 
    required this.description, 
    required this.listTutorial, 
    required this.listCharacters});
}