import 'package:flutter/material.dart';
//import 'package:my_aplication_proeyctdm1/screen/characterlist_page.dart';
import 'package:fightvlearning_app/entity/combo.dart';
import 'package:fightvlearning_app/entity/videogame.dart';

int counter = 0;

List<Combo> listCombos = [
  Combo(id: 1 , name: 'combo 1', safe: false, listMovements: [])

];

class MyCombosPage extends StatefulWidget{
  final Videogame game;

  const MyCombosPage({super.key, required this.game});

  @override
  MycombosPageState createState() => MycombosPageState();
}


class MycombosPageState extends State<MyCombosPage> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Mis combos')
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