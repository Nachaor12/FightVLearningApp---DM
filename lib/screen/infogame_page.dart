import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';

int _counter = 0;


class InfoGamePage extends StatelessWidget {
  final Videogame game;

  const InfoGamePage({super.key, required this.game});

  void _incrementCounter() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('ProfilePage'),
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