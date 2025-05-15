import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';

class GamePage extends StatelessWidget {
  final Videogame juego;

  const GamePage({super.key, required this.juego});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(juego.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(juego.description),
      ),
    );
  }
}