import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';
import 'package:my_aplication_proeyctdm1/screen/characterlist_page.dart';
import 'package:my_aplication_proeyctdm1/screen/infogame_page.dart';
import 'package:my_aplication_proeyctdm1/screen/infotutorial_page.dart';
import 'package:my_aplication_proeyctdm1/screen/mycombos_page.dart';


void goToInfoPage(BuildContext context, Videogame game){
  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoGamePage(game: game,)));
}
void goToTutorialPage(BuildContext context, Videogame game){
  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTutorialPage(game: game,)));
}
void goToCharacterPage(BuildContext context, Videogame game){
  Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterlistPage(game: game,)));
}
void goToMyCombosPage(BuildContext context, Videogame game){
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyCombosPage(game: game,)));
}

Widget textTitle(int index){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        verticalDirection: VerticalDirection.up,
        children: [
          Stack(
            children: [
              Text(
                listTextPage[index],
                style: TextStyle(
                  fontSize: 22,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3.5
                    ..color = Colors.black,
                ),
              ),
              Text(
                listTextPage[index],
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
  
List<String> listTextPage = [
  'Informacion general',
  'Tutorial general',
  'Personajes',
  'Mis combos',
];

List<Widget> listButtonsFunction(BuildContext context, Videogame game, int index){
  final List<Widget> listButtons = <Widget>[
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(16),
      ),
      onPressed: () => goToInfoPage(context, game),
      child: textTitle(index),
    ),
  ];
  return listButtons;
}

class GamePage extends StatelessWidget {
  final Videogame game;

  const GamePage({super.key, required this.game});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index){
                  final listOfContent = listButtonsFunction(context, game, index);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image(
                                  image: game.listButtonsPages[index],
                                  fit: BoxFit.cover
                                ),
                            /*child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Opacity(
                                opacity: 1,
                                
                              )
                            ),*/
                          ),
                          Positioned.fill(
                            child: listOfContent[index],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }


  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.name),
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: listGameInfo.length,
                itemBuilder: (context, index){
                  final game = listGameInfo[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //backgroundColor: const Color.fromARGB(0, 140, 140, 140),
                          //shadowColor: const Color.fromARGB(0, 190, 190, 190),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => game_page(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              game.name,
                              style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 0, 0, 0)),    
                            ),
                            Opacity(
                              opacity: 0.5,
                              child: Image(
                                image: game.image,
                                width: 250,
                                height: 250,
                              ),
                            ),
                          ],
                        ),
                      )
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  } */
}