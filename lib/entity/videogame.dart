import 'package:flutter/widgets.dart';
import 'package:my_aplication_proeyctdm1/entity/character.dart';

class Videogame {
  String name; //Nombre del juego/identificador
  ImageProvider image; //Imagen/logo del juego
  int released; //Año de lanzamiento
  String developer; //Desarrolladora
  bool favorite; //Si es favorito del usuario
  Icon icon; //Icono de favorito
  String description; //Una descripcion del juego en general
  List<String> listTutorial;
  List<Character> listCharacters; //Lista de personajes que contempla el juego

  Videogame({
    required this.name, 
    required this.image,
    required this.released, 
    required this.developer, 
    required this.favorite,
    required this.icon, 
    required this.description, 
    required this.listTutorial, 
    required this.listCharacters});
}