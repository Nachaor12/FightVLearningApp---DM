
import 'package:flutter/material.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fightvlearning_app/entity/user.dart';

class AppData extends ChangeNotifier {
  //Data de la app
  final List<Videogame> listGamesHome = <Videogame>[
    Videogame(
      id: 1,
      name: 'Street Fighter III: third strike', 
      image: AssetImage("assets/icons/sf3-3rd-strike-logo.png"),
      listButtonsPages: [
        AssetImage("assets/icons/sf3-3rdstrike-art-by-kinu-unfinished.jpg"),  //Informacion general
        AssetImage("assets/icons/Parry_the_ball_bonus_game_sf3.png"),         //Tutorial general
        AssetImage("assets/icons/sf3-3rd-strike-characters-daigo-ikeno.jpg"), //Personajes
        AssetImage("assets/icons/SFIII_3S-Ken_Ending-1.webp"),                //Mis combos
        ////////////////////////////////////////////////////////////////////////////////////////////
        AssetImage("assets/icons/yang-3s-up.jpg"),                            //Movimiento
        AssetImage("assets/icons/Gamest_Mook_Vol_194.webp"),                  //Ataque
        AssetImage("assets/icons/SFIII_3S-Oro_Ending-3.webp"),                //Defensa
        AssetImage("assets/icons/HUD_image_round.png"),                      //Hud/Interfaz
        AssetImage("assets/icons/SFIII-Chun-Li-1.webp"),                      //Mecanicas
      ],
      released: 1999, 
      developer: 'CAPCOM', 
      favorite: false, 
      icon: Icon(Icons.favorite_border, size: 30, color: Colors.redAccent),
      description: 'El tercer videojuego enumerado de la saga original "Street Fighter"',
      listTutorial: [
        'Movimiento: ',
        'Mecanicas: ',
        'HUD/Interfaz: ',
        'Ataque: ',
        'Defensa: ',
        ],
      listCharacters: []
    ),
  ];
  AppData() {
    //print('Se llamo a AppData');
  }
  //Booleano para saber si esta editando un combo
  
  //Indice con el cual cambiar el tabBar desde otras pantallas
  int tabIndex = 0;
  //Datos del usuario
  ImageProvider userEmptyImage = AssetImage("assets/icons/icon_userempty.png");
  String newNameUser = 'Empty User';
  String newEmailUser = 'Empty_User@gmail.com';
  String newNumberUser = '12345';
  List<Videogame> gameFavShow = [];
  List<int> userFavGames = [];
  List<User> users = [];

  ImageProvider changeImageUser(ImageProvider imageUser) {
    if(users.isEmpty){
      return userEmptyImage;
    }
    return imageUser;
  }

  void changeFavorite(Videogame game){
    game.favorite = !game.favorite;
    if(game.favorite != true){
      game.icon = Icon(Icons.favorite_border, size: 30, color: Colors.redAccent);
      for(int i = 0; i < userFavGames.length; i++){
        if(userFavGames[i] == listGamesHome[i].id){
          gameFavShow.remove(listGamesHome[i]);
        }
      }
      userFavGames.remove(game.id);
    }
    else{
      game.icon = Icon(Icons.favorite_sharp, size: 30, color: Colors.redAccent);
      userFavGames.add(game.id);
      for(int i = 0; i < userFavGames.length; i++){
        if(userFavGames[i] == listGamesHome[i].id){
          gameFavShow.add(listGamesHome[i]);
        }
      }
    }
  }

  //Preferencias
  bool activeNotifer = false;
  bool shareCombos = false;
  bool recomendCombos= false;

  //Valor para comprobar estado de la lista
  bool usersIsEmpty = false;
  

  //Cargar preferencias
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    activeNotifer = prefs.getBool('isActiveNotiferEnabled') ?? false;
    shareCombos = prefs.getBool('isShareCombosEnabled') ?? false;
    recomendCombos = prefs.getBool('isRecomendCombosEnabled') ?? false;

    newNameUser = prefs.getString('isNewNameUser') ?? 'Empty User';
    newEmailUser = prefs.getString('isNewEmailUser') ?? 'Empty_User@gmail.com';
    newNumberUser = prefs.getString('isNewNumberUser') ?? '12345';

    usersIsEmpty = prefs.getBool('isusersIsEmpty') ?? false;
    notifyListeners();
    //print("Nombre cargado: $newNameUser");

  }

  //Guardar preferencias
  Future<void> savedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isActiveNotiferEnabled', activeNotifer);
    await prefs.setBool('isShareCombosEnabled', shareCombos);
    await prefs.setBool('isRecomendCombosEnabled', recomendCombos);

    await prefs.setString('isNewNameUser', newNameUser);
    await prefs.setString('isNewEmailUser', newEmailUser);
    await prefs.setString('isNewNumberUser', newNumberUser);

    await prefs.setBool('isusersIsEmpty', usersIsEmpty);
    //print('Se guardaron las preferencias, nombre de usuario: $newNameUser');
  }
}