import 'package:my_aplication_proeyctdm1/entity/character.dart';

class Videogame {
  String name;
  int released;
  String developer;
  bool favorite;
  String description;
  List<Character> listCharacters;

  Videogame({required this.name, required this.released, required this.developer, 
            required this.favorite, required this.description, required this.listCharacters});
}