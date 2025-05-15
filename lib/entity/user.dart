import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';

class User{
  String name;
  String email;
  Image image;
  List<Videogame> listFavVideogame;
  //List<Character> listFavCharacter;
  
  User({required this.name, required this.email, required this.image, required this.listFavVideogame});

}