import 'dart:convert';
import 'dart:typed_data';

class User{
  int id; //ID de usuario
  String name; //Nombre de usuario
  String email; //Email de usuario
  String image; //Imagen que desee añadir
  //String favoriteGame; //Juego favorito
  List<int> listFavVideogame; //Lista de juegos favoritos
  //List<Character> listFavCharacter;
  
  User({required this.id, required this.name, required this.email, required this.image, required this.listFavVideogame});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'email': email, 'image': image, 'listFavVideogame': jsonEncode(listFavVideogame)};
  }

  @override
  String toString(){
    return 'User{id: $id, name: $name, email: $email, image: $image, listFavVideogame: $listFavVideogame';
  }

  factory User.fromMap(Map<String, dynamic> map){

    final rawList = map['listFavVideogame'];

    // Manejar si viene como Uint8List (caso típico de SQLite)
    final decodedString = rawList is Uint8List
        ? utf8.decode(rawList)
        : rawList.toString(); // por si viene como String directo

    final List<dynamic> parsedJson = jsonDecode(decodedString);
    final List<int> favIds = parsedJson.cast<int>(); // asegurarse que sea List<int>

    return User(
      id: map['id'], 
      name: map['name'], 
      email: map['email'], 
      image: map['image'],
      listFavVideogame: favIds,
      );
  }
}