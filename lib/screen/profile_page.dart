import 'package:fightvlearning_app/entity/user.dart';
import 'package:fightvlearning_app/services/notifications.dart';
import 'package:flutter/material.dart';
import 'package:fightvlearning_app/services/database_helper.dart';
import 'package:provider/provider.dart';
import 'package:fightvlearning_app/provider/appdata.dart';


class MyProfilePage extends StatefulWidget{
  const MyProfilePage({super.key});

  @override
  MyProfilePageState createState() => MyProfilePageState();
}


class MyProfilePageState extends State<MyProfilePage> {
  int idCounter = 1; //Para la id de cada usuario
  bool addNewUser = false; //Para saber si esta editando o no
  bool selectingUsers = false; //Para saber si esta elijiendo un usuario o no

  final DatabaseHelper _dbHelper = DatabaseHelper(); //base de datos

  @override
  void initState() {
    super.initState();
    _loadUser();
  }
  //Se cargan los usuarios
  void _loadUser() async{
    final users = await _dbHelper.getUsers();
    setState(() {
      context.read<AppData>().users = users;
    });
  }
  //Verfica si estan todos los campos
  void checkUser(BuildContext context) async{
    String nameUser = context.read<AppData>().newNameUser;
    String emailUser = context.read<AppData>().newEmailUser;
    String numberUser = context.read<AppData>().newNumberUser;
    if(nameUser == '' || emailUser == '' || numberUser == ''){
      //print('Usuario no creado, falta de datos');
    }
    else{
      addUser(nameUser, emailUser, numberUser, context.read<AppData>().userFavGames);
      setState(() {
        addNewUser = !addNewUser;
        context.read<AppData>().newNameUser = nameUser;
        context.read<AppData>().newEmailUser = emailUser;
        context.read<AppData>().newNumberUser = numberUser;
        context.read<AppData>().savedPreferences();
      });
    }
  }
  //Para añadir nuevo usuarios
  void addUser(String nameUser, String emailUser, String imageUser, List<int> listFavorite) async{
    final newUser = User(id: idCounter, name: nameUser, email: emailUser, image: imageUser, listFavVideogame: listFavorite);
    await _dbHelper.insertUser(newUser);
    final users = await _dbHelper.getUsers();
    idCounter++;
    setState(() {
      context.read<AppData>().users = users;
      context.read<AppData>().usersIsEmpty = false;
    });
  }
  //Para eliminar un usuario
  void quitUser() async{
    await _dbHelper.deleteUser(context.read<AppData>().users.length);
    final users = await _dbHelper.getUsers();
    idCounter--;
    if(idCounter <= 0){
      idCounter = 1;
    }
    setState((){
      context.read<AppData>().users = users;
      int size = context.read<AppData>().users.length;
      if(context.read<AppData>().users.isEmpty){
        context.read<AppData>().usersIsEmpty = true;
      }
      else{
        context.read<AppData>().newNameUser = context.read<AppData>().users[size - 1].name;
        context.read<AppData>().newEmailUser = context.read<AppData>().users[size - 1].email;
        context.read<AppData>().newNumberUser = context.read<AppData>().users[size - 1].image;
      }
      context.read<AppData>().savedPreferences();
    });
  }
  //Para editar el usuario
  void editUser() async{
    
  }
  //Para seleccionar al usuario (editar o eliminar)
  void selectUser() async{

  }
  //Para mostrar cuando hay SI usuarios o cuando NO usuarios
  Widget selectAddUser(){
    if(context.read<AppData>().users.isNotEmpty && !selectingUsers){
      return Scaffold( //Widget para cuando hay usuarios registrados
        body: ListTile(
          title: Center(
            heightFactor: 1,
            child: Column(
              children: [
                SizedBox(height: 30),
                Container( //Imagen del usuario (+ borde con container)
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 175, 175, 175), shape: BoxShape.circle,),
                  child: CircleAvatar(minRadius: 30, maxRadius: 45, backgroundColor: Colors.black, backgroundImage: context.read<AppData>().userEmptyImage),
                ),
                SizedBox(height: 20), //Nombre del usuario
                Text(context.watch<AppData>().users[context.watch<AppData>().users.length - 1].name,textScaler: TextScaler.linear(1.4),),
                SizedBox(height: 10), //Correo del usuario
                Text(context.watch<AppData>().users[context.watch<AppData>().users.length - 1].email,textScaler: TextScaler.linear(0.8),),
                Container(
                  margin: EdgeInsets.all(16), // espacio alrededor del recuadro
                  padding: EdgeInsets.all(16), // espacio dentro del recuadro
                  decoration: BoxDecoration(
                    color: Colors.blue[100], // color de fondo del recuadro
                    borderRadius: BorderRadius.circular(12), // bordes redondeados
                    border: Border.all(color: Colors.blue), // borde exterior
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [ //Opciones
                      ListTile(title: Text('Mis Juegos', style: TextStyle(fontSize: 20),), leading: Icon(Icons.sports_esports_outlined, size: 30,), onTap: (){},),
                      ListTile(title: Text('Soporte', style: TextStyle(fontSize: 20),), leading: Icon(Icons.support_agent_outlined, size: 30,), onTap: (){},),
                      ListTile(title: Text('Acerca de', style: TextStyle(fontSize: 20),), leading: Icon(Icons.info_outlined, size: 30,), onTap: (){},),
                      ListTile(title: Text('Preferencias', style: TextStyle(fontSize: 20),), leading: Icon(Icons.settings_outlined, size: 30,), onTap: (){},),
                      ListTile(title: Text('Cerrar sesión', style: TextStyle(fontSize: 20),), leading: Icon(Icons.exit_to_app_outlined, size: 30,), onTap: (){},),
                    ],
                  ),
                ),
              ],
            )
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.topCenter,
        persistentFooterButtons: [
          TextButton(onPressed: quitUser, child: Icon(Icons.remove, size: 30,)),
          TextButton(onPressed: () {setState(() {
            addNewUser = !addNewUser;
          });}, child: Icon(Icons.add_circle_rounded, size: 50,)),
          TextButton(onPressed: editUser, child: Icon(Icons.edit, size: 30,)),
        ],
      );
    }
    else if(selectingUsers){
      return Scaffold( //Widget para buscar usuarios registrados
        body: ListView.builder(
          itemCount: context.read<AppData>().users.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Center(
                heightFactor: 2,
                child: Text(
                  context.read<AppData>().users[index].toString()
                ),
              )
            );
          }
        ),
      );
    } //Widget para cuando no hay usuarios registrados
    return Scaffold(
      body: ListTile(
        title: Center(
          heightFactor: 1,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(color: const Color.fromARGB(255, 175, 175, 175), shape: BoxShape.circle,),
                child: CircleAvatar(minRadius: 40, maxRadius: 60, backgroundColor: Colors.black, backgroundImage: context.read<AppData>().userEmptyImage),
              ),
              SizedBox(height: 60),
              Text('No hay un usuario registrado'),
            ],
          )
        ),
      ),
      persistentFooterButtons: [
        TextButton(onPressed: () {setState(() {
          addNewUser = !addNewUser;
        });}, child: Icon(Icons.add_circle_rounded, size: 50,)),
      ],
      persistentFooterAlignment: AlignmentDirectional.topCenter,
    );
  }
  //Widget para la edicion del usuario (o agregarlo)
  Scaffold editingAddUser() {
    return Scaffold(
      body: ListTile(
        title: Center(
          heightFactor: 1,
          child: Column(
            children: [
              SizedBox(height: 25,),
              GestureDetector(
                onTap: () {
                  //print('Avatar presionado');
                },
                child: Container(
                  padding: EdgeInsets.all(2), // Grosor del borde
                  decoration: BoxDecoration(color: const Color.fromARGB(255, 175, 175, 175), shape: BoxShape.circle,),
                  child: CircleAvatar(minRadius: 30, maxRadius: 50, backgroundColor: Colors.black, backgroundImage: context.read<AppData>().userEmptyImage,
                  child: Column(
                    children: [
                      SizedBox(height: 65,),
                      Row(
                        children: [
                          SizedBox(width: 68,),
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(color: const Color.fromARGB(255, 203, 175, 175), shape: BoxShape.circle,),
                            child: Icon(Icons.mode_edit_rounded, size: 30,),
                          )
                        ],
                      )
                    ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text('Nombre: '),
                  Expanded(child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Biblioteca',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        context.read<AppData>().newNameUser = value;
                      })
                    },
                    )
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text('Email: '),
                  SizedBox(width: 18,),
                  Expanded(child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Biblioteca234@gmail.com',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        context.read<AppData>().newEmailUser = value;
                      })
                    },
                    )
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Text('Número: '),
                  Expanded(child: TextField(
                    decoration: const InputDecoration(
                      hintText: '987654321',
                      contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        context.read<AppData>().newNumberUser = value;
                      })
                    },
                    )
                  ),
                ],
              ),
            ],
          )
        )
      ),
      persistentFooterAlignment: AlignmentDirectional.topStart,
      persistentFooterButtons: [
        TextButton(onPressed: () {setState(() {
          addNewUser = !addNewUser;
        });}, child: Icon(Icons.arrow_circle_left_rounded, size: 50,)),
        SizedBox(width: 70,),
        TextButton(onPressed: () {checkUser(context); showNotification(id: 1, title: '¡Nuevo usario registrado!', body: 'Se ha registrado al usuario con exito ✅');}, child: Icon(Icons.check_circle_rounded, size: 50,)),
      ],
    );
  }

  //Para designar el widget principal (MOSTRAR usuario o EDITAR usuario)
  Widget seeWidget(){
    if(!addNewUser){
      return selectAddUser();
    }
    return editingAddUser();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: seeWidget(),
    );
  }
} 