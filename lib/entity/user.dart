
class User{
  int id; //ID de usuario
  String name; //Nombre de usuario
  String email; //Email de usuario
  String image; //Imagen que desee añadir
  //String favoriteGame; //Juego favorito
  //List<Videogame> listFavVideogame; //Lista de juegos favoritos
  //List<Character> listFavCharacter;
  
  User({required this.id, required this.name, required this.email, required this.image/*, required this.listFavVideogame*/});

  Map<String, Object?> toMap() {
    return {'id': id, 'name': name, 'email': email, 'image': image/*, 'listFavVideogame': listFavVideogame*/};
  }

  @override
  String toString(){
    return 'User{id: $id, name: $name, email: $email, image: $image';
  }

  factory User.fromMap(Map<String, dynamic> map){
    return User(
      id: map['id'], 
      name: map['name'], 
      email: map['email'], 
      image: map['image']
      /*, listFavVideogame: map['listFavVideogame']*/
      );
  }

}