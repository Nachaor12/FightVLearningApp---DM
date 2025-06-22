import 'package:flutter/widgets.dart';
import 'package:fightvlearning_app/entity/combo.dart';
import 'package:fightvlearning_app/entity/movement.dart';


class Character{
  String name; //Nombre del personaje
  ImageProvider image; //Imagen del personaje (cuerpo completo)
  ImageProvider imageMenu; //Imagen del menu del personaje
  String description; //Descripción de la historia del personaje
  List<Movement> listMovements; //Lista de movimientos
  List<Combo> listCombos; //Lista de combos

  Character({required this.name, required this.description, 
            required this.image, required this.imageMenu,
            required this.listMovements, required this.listCombos});
}