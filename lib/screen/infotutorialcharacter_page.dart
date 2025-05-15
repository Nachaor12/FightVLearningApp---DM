import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/entity/character.dart';



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
  final Character characater;
  final String textTitle;

  const InfoTutorialCharacterPage({super.key, required this.characater, required this.textTitle});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(textTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Image(image: characater.imageMenu, width: 200, height: 200,),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return textStyleTitle(characater.name);
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