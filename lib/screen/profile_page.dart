import 'package:flutter/material.dart';
//import 'package:my_aplication_proeyctdm1/entity/user.dart';
import 'package:fightvlearning_app/screen/home_page.dart';
//import 'package:my_aplication_proeyctdm1/screen/preferences.dart';
import 'package:fightvlearning_app/services/database_helper.dart';
import 'package:fightvlearning_app/services/notifications.dart';
import 'package:provider/provider.dart';
//import 'package:my_aplication_proeyctdm1/screen/home.dart';


class MyProfilePage extends StatefulWidget{
  const MyProfilePage({super.key});

  @override
  MyProfilePageState createState() => MyProfilePageState();
}


class MyProfilePageState extends State<MyProfilePage> {
  int idCounter = 1;
  bool addNewUser = false;

  final DatabaseHelper _dbHelper = DatabaseHelper();
  //List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }


  void _loadUser() async{
    final users = await _dbHelper.getUsers();
    setState(() {
      context.read<AppData>().users = users;
    });
  }

  void newUserAdd() async{
    //showNotification();
  }

  void quitUser() async{
    await _dbHelper.deleteUser(context.read<AppData>().users.length);
    final users = await _dbHelper.getUsers();
    idCounter--;
    if(idCounter <= 0){
      idCounter = 1;
    }
    setState((){
      context.read<AppData>().users = users;
    });
  }

  void editUser() async{

  }

  void selectUser() async{

  }

  Widget selectAddUser(){
    if(context.read<AppData>().users.isNotEmpty){
      return Scaffold(
        body: ListTile(
          title: Center(
            heightFactor: 2,
            child: Text(
              context.read<AppData>().users[0].toString()
            ),
          ),
        ),
        persistentFooterAlignment: AlignmentDirectional.topCenter,
        persistentFooterButtons: [
          TextButton(onPressed: quitUser, child: Icon(Icons.remove, size: 30,)),
          TextButton(onPressed: newUserAdd, child: Icon(Icons.add_circle_rounded, size: 50,)),
          TextButton(onPressed: editUser, child: Icon(Icons.edit, size: 30,)),
        ],
      );
    }
    return Scaffold(
      body: ListTile(
        title: Center(
          heightFactor: 1,
          child: Column(
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(2), // Grosor del borde
                decoration: BoxDecoration(color: const Color.fromARGB(255, 175, 175, 175), shape: BoxShape.circle,),
                child: CircleAvatar(minRadius: 50, maxRadius: 70, backgroundColor: Colors.black, backgroundImage: context.read<AppData>().userEmptyImage),
              ),
              SizedBox(height: 60),
              Text('No hay un usuario registrado'),
            ],
          )
        ),
      ),
      persistentFooterButtons: [
        TextButton(onPressed: () {
          scheduleNotification(
            title: 'Hola', 
            body: 'Funciona despues de todo', 
            hour: 7, 
            minute: 30,
            payLoad: 'Vaya que tardo'
          );
        }, 
        child: Icon(Icons.add_circle_rounded, size: 50,))
      ],
      persistentFooterAlignment: AlignmentDirectional.topCenter,
    );
  }

  Widget seeWidget(){
    if(!addNewUser){
      return selectAddUser();
    }
    return ListView.builder(
      itemCount: context.read<AppData>().users.length,
      itemBuilder: (context, index){
        return ListTile(
          title: Center(
            heightFactor: 1,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Ingresa ID de la actividad', 
                    border: OutlineInputBorder()
                  ),
                  onChanged: (value) {
                    setState(() {
                      
                    });
                  },
                )
              ],
            )
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: seeWidget(),
    );
  }
} 