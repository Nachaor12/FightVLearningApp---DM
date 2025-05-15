import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';



Widget textTitle(String text){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    spacing: 3,
    children: [
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

class InfoGamePage extends StatelessWidget {
  final Videogame game;

  const InfoGamePage({super.key, required this.game});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Informacion general'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(image: game.image, width: 200, height: 200,),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return textTitle(game.name);
                },
              ),
            ),
            const Text('Page in process of content'),
          ],
        ),
      ),
    );
  }
}