import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/services/notifications.dart';
//import 'package:my_aplication_proeyctdm1/screen/home.dart';




class MyLikespage extends StatefulWidget{
  const MyLikespage({super.key});

  @override
  MyLikespageState createState() => MyLikespageState();
}


class MyLikespageState extends State<MyLikespage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showNotification(id: 2, title: 'Nueva notificacion', body: 'Recibiste una nueva notificacion');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}