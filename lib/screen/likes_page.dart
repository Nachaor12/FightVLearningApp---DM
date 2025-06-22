import 'package:fightvlearning_app/provider/appdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fightvlearning_app/screen/game_page.dart';
//import 'package:my_aplication_proeyctdm1/screen/home.dart';




class MyLikespage extends StatefulWidget{
  const MyLikespage({super.key});

  @override
  MyLikespageState createState() => MyLikespageState();
}


class MyLikespageState extends State<MyLikespage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: context.watch<AppData>().userFavGames.length,
          itemBuilder: (context, index){
            final game = context.watch<AppData>().gameFavShow[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 120,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Opacity(
                          opacity: 0.7,
                          child: Image(
                            image: game.image,
                            fit: BoxFit.contain
                          ),
                        )
                      ),
                    ),
                    Positioned.fill(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(0, 185, 185, 185),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GamePage(game: game),
                            ),
                          );
                        },
                        child:Column(
                          verticalDirection: VerticalDirection.up,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    Text(
                                      game.name,
                                      style: TextStyle(
                                        fontSize: 22,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 3.5
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    Text(
                                      game.name,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {setState(() {
                                    context.read<AppData>().changeFavorite(game); 
                                  });},
                                  child: game.icon
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){ },
        child: const Icon(Icons.add),
      ), 
    );
  }
}