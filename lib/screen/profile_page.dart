import 'package:flutter/material.dart';
//import 'package:my_aplication_proeyctdm1/screen/home.dart';

int _counter = 0;


class MyProfilePage extends StatefulWidget{
  const MyProfilePage({super.key});

  @override
  MyProfilePageState createState() => MyProfilePageState();
}



class MyProfilePageState extends State<MyProfilePage> {
  

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}