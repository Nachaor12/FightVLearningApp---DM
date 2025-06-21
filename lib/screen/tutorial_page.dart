import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:fightvlearning_app/screen/infotutorial_page.dart';

var logger = Logger();

void goToInfoPage(BuildContext context, Videogame game, String text){
  Navigator.push(context, MaterialPageRoute(builder: (context) => InfoTutorialPage(game: game, textTitle: text,)));
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
                listTextTitle[index],
                style: TextStyle(
                  fontSize: 22,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3.5
                    ..color = Colors.black,
                ),
              ),
              Text(
                listTextTitle[index],
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
  
List<String> listTextTitle = [
  'Movimiento',
  'Ataque',
  'Defensa',
  'HUD/Interfaz',
  'Mecanicas'
];

Widget buttonFunction(BuildContext context, Videogame game, int index, String text){
  
  return  ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(0, 185, 185, 185),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),padding: EdgeInsets.all(16),),
      onPressed: () => goToInfoPage(context, game,text),
      child: textTitle(index),
    );
}

class TutorialPage extends StatelessWidget {
  final Videogame game;

  const TutorialPage({super.key, required this.game});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: listTextTitle.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image(
                              image: game.listButtonsPages[index + 4],
                              alignment: Alignment.center,
                              fit: BoxFit.cover
                            ),
                          ),
                          Positioned.fill(
                            child: buttonFunction(context, game, index, game.name),
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