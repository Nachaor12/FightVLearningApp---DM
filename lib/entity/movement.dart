import 'package:flutter/material.dart';

class Movement {
  int id; //ID del movimiento
  String input; //Input del movimiento 
  Image image; //Imagen del imput
  List<int> frameData; //Informacion de cuantos frames toma el movimiento
  final List<Movement> cancelMoves; //Movimiento con los que se puede cancelar

  Movement({required this.id, required this.input, required this.image, required this.frameData, required this.cancelMoves});
}