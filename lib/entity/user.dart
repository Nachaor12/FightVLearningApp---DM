import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';

class User{
  String name; //Nombre de usuario
  String email; //Email de usuario
  Image image; //Imagen que desee añadir
  //String favoriteGame; //Juego favorito
  List<Videogame> listFavVideogame; //Lista de juegos favoritos
  //List<Character> listFavCharacter;
  
  User({required this.name, required this.email, required this.image, required this.listFavVideogame});

}