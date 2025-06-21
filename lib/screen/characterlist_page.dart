import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:fightvlearning_app/entity/character.dart';
import 'package:fightvlearning_app/screen/character_page.dart';

var logger = Logger();

void goToCharacterPage(BuildContext context, Videogame game,Character character){
  Navigator.push(context, MaterialPageRoute(builder: (context) => CharacterPage(game: game, character: character,)));
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
                listCharacters[index].name,
                style: TextStyle(
                  fontSize: 22,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3.5
                    ..color = Colors.black,
                ),
              ),
              Text(
                listCharacters[index].name,
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
  

List<Character> listCharacters = [
  Character(name: 'Akuma', image: AssetImage("assets/characters/complete/akuma-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/akuma-3rd.jpg"),
            description: 'Satsui no Hado/Ansatsuken', listMovements: [], listCombos: []),
  Character(name: 'Alex', image: AssetImage("assets/characters/complete/alex-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/alex-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Chun li', image: AssetImage("assets/characters/complete/chunli-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/chunli-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Dudley', image: AssetImage("assets/characters/complete/dudley-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/dudley-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Elena', image: AssetImage("assets/characters/complete/elena-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/elena-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Gill', image: AssetImage("assets/characters/complete/gill-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/gill-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Hugo', image: AssetImage("assets/characters/complete/hugo-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/hugo-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Ibuki', image: AssetImage("assets/characters/complete/ibuki-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/ibuki-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Ken', image: AssetImage("assets/characters/complete/ken-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/ken-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Makoto', image: AssetImage("assets/characters/complete/makoto-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/makoto-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Necro', image: AssetImage("assets/characters/complete/necro-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/necro-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Oro', image: AssetImage("assets/characters/complete/oro-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/oro-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Q', image: AssetImage("assets/characters/complete/q-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/q-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Remy', image: AssetImage("assets/characters/complete/remy-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/remy-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Ryu', image: AssetImage("assets/characters/complete/ryu-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/ryu-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Sean', image: AssetImage("assets/characters/complete/sean-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/sean-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Twelve', image: AssetImage("assets/characters/complete/twelve-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/twelve-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Urien', image: AssetImage("assets/characters/complete/urien-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/urien-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Yang', image: AssetImage("assets/characters/complete/yang-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/yang-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
  Character(name: 'Yun', image: AssetImage("assets/characters/complete/yun-3s.jpg"), 
            imageMenu: AssetImage("assets/characters/face/yun-3rd.jpg"),
            description: '', listMovements: [], listCombos: []),
];

Widget buttonFunction(BuildContext context, Videogame game, Character character, int index){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(0, 185, 185, 185),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),padding: EdgeInsets.all(16),),
    onPressed: () => goToCharacterPage(context, game, character),
    child: textTitle(index),
  );
}

class CharacterlistPage extends StatelessWidget {
  final Videogame game;

  const CharacterlistPage({super.key, required this.game});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personajes'),
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Center(
              child: ListView.builder(
                itemCount: listCharacters.length,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 120,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image(
                              image: listCharacters[index].imageMenu,
                              alignment: Alignment.topRight,
                              fit: BoxFit.fitWidth,
                            ),
                            
                          ),
                          Positioned.fill(
                            child: buttonFunction(context, game, listCharacters[index], index),
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