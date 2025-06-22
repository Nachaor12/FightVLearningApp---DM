import 'package:flutter/material.dart';
import 'package:fightvlearning_app/entity/character.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:fightvlearning_app/screen/infotutorialcharacter_page.dart';
import 'package:fightvlearning_app/screen/characterlist_page.dart';
import 'package:fightvlearning_app/screen/combo_page.dart';


Widget textStyleTitle(String textTitle, String textDescription){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        children: [
          Text(
            textTitle,
            style: TextStyle(
              fontSize: 22,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3.5
                ..color = Colors.black,
            ),
          ),
          Text(
            textTitle,
            style: TextStyle(
              fontSize: 22,
              color: Colors.white
            ),
          ),
        ],
      ),
      Text(textDescription),
    ],
  );
}


class CharacterPage extends StatelessWidget {
  final Videogame game;
  final Character character;

  const CharacterPage({super.key, required this.game, required this.character});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(character.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) => CharacterlistPage(game: game,)));
          }
        ),
        actions: [
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
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Image(image: character.image, width: 200, height: 200,),
                //SizedBox(width: 10),
                textStyleTitle(character.name, character.description),
                //SizedBox(width: 10,)
              ],
            ),
            SizedBox(height: 40),
            const Text('Page in process of content'),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Text(''),
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Tutorial', textScaler: TextScaler.linear(1)),onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) => InfoTutorialCharacterPage(game: game ,character: character, nameCharacter: character.name, textTitle: 'Tutorial',)));
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Movimientos'), onTap: () {Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTutorialCharacterPage(game: game ,character: character, nameCharacter: character.name, textTitle: 'Movimientos',)));
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Combos'), onTap: () {Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ComboPage()));
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Especificaciones'), onTap: () {Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTutorialCharacterPage(game: game ,character: character, nameCharacter: character.name, textTitle: 'Especificaciones',)));
              },
            ),
          ],
        ),
      ),
    );
  }
}