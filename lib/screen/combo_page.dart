import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/combo.dart';
//import 'package:my_aplication_proeyctdm1/entity/movement.dart';

int counter = 1;

class ComboPage extends StatefulWidget{
  //final Movement moves;
  const ComboPage({super.key, /*required this.moves*/});

  @override
  ComboPageState createState() => ComboPageState();
}

List<Combo> listCombos = [
  Combo(name: 'combo 1', safe: false, listMovements: [])

];

class ComboPageState extends State<ComboPage> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Combos")
      ),
      body: ListView.builder(
        itemCount: counter, 
        itemBuilder: (context, index){
          return ListTile(
            title: Center(
              heightFactor: 5,
              child: Text(listCombos[index].name),
            )
          );
        })
    );
  }
}