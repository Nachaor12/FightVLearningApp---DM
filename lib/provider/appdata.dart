
import 'package:flutter/material.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fightvlearning_app/entity/user.dart';

class AppData extends ChangeNotifier {

  AppData() {
    //print('Se llamo a AppData');
  }
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