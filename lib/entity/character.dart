import 'package:flutter/widgets.dart';
import 'package:fightvlearning_app/entity/combo.dart';
import 'package:fightvlearning_app/entity/movement.dart';


class Character{
  String name;
  ImageProvider image;
  ImageProvider imageMenu;
  String description;
  List<Movement> listMovements;
  List<Combo> listCombos;

  Character({required this.name, required this.description, 
            required this.image, required this.imageMenu,
            required this.listMovements, required this.listCombos});
}