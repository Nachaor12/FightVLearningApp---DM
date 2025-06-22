import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:fightvlearning_app/screen/characterlist_page.dart';
import 'package:fightvlearning_app/screen/infogame_page.dart';
import 'package:fightvlearning_app/screen/tutorial_page.dart';
import 'package:fightvlearning_app/screen/mycombos_page.dart';

var logger = Logger();

void goToInfoPage(BuildContext context, Videogame game){
  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoGamePage(game: game,)));
}
void goToTutorialPage(BuildContext context, Videogame game){
  Navigator.push(context, MaterialPageRoute(builder: (context) => TutorialPage(game: game,)));
}
void goToCharacterListPage(BuildContext context, Videogame game){
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
    ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(0, 185, 185, 185),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),padding: EdgeInsets.all(16),),
      onPressed: () => goToInfoPage(context, game),
      child: textTitle(index),
    ),
    ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(0, 185, 185, 185),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),padding: EdgeInsets.all(16),),
      onPressed: () => goToTutorialPage(context, game),
      child: textTitle(index),
    ),
    ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(0, 185, 185, 185),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),padding: EdgeInsets.all(16),),
      onPressed: () => goToCharacterListPage(context, game),
      child: textTitle(index),
    ),
    ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(0, 185, 185, 185),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),padding: EdgeInsets.all(16),),
      onPressed: () => goToMyCombosPage(context, game),
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
                itemCount: 4,
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
                              alignment: Alignment.center,
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
}