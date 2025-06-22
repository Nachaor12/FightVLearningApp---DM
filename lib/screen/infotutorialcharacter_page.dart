import 'package:flutter/material.dart';
import 'package:fightvlearning_app/entity/character.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:fightvlearning_app/screen/character_page.dart';
//import 'package:fightvlearning_app/screen/combo_page.dart';



Widget textStyleTitle(String text){
  return Row(
    children: [
      SizedBox(width: 20),
      Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Stack(
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 22,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3.5
                    ..color = Colors.black,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class InfoTutorialCharacterPage extends StatelessWidget {
  final Videogame game;
  final Character character;
  final String nameCharacter;
  final String textTitle;

  const InfoTutorialCharacterPage({super.key, required this.game, required this.character, required this.nameCharacter, required this.textTitle});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(textTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Si quieres volver simplemente:
            Navigator.pop(context, MaterialPageRoute(builder: (context) => CharacterPage(game: game, character:  character)));
          }
        ),
        /*actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],*/
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Image(image: character.imageMenu, width: 200, height: 200,),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return textStyleTitle(character.name);
                },
              ),
            ),
            Text(textTitle),
            const Text('Page in process of content'),
          ],
        ),
      ),
      /*endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Tutorial', textScaler: TextScaler.linear(1)),
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => InfoTutorialCharacterPage(game: game ,character: character, nameCharacter: character.name, textTitle: 'Tutorial',)));
              },
            ),
            ListTile(
              title: const Text('Movimientos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTutorialCharacterPage(game: game ,character: character, nameCharacter: character.name, textTitle: 'Movimientos',)));
              },
            ),
            ListTile(
              title: const Text('Combos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ComboPage()));
              },
            ),
            ListTile(
              title: const Text('Especificaciones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTutorialCharacterPage(game: game , character: character, nameCharacter: character.name, textTitle: 'Especificaciones',)));
              },
            ),
          ],
        ),
      ),*/
    );
  }
}