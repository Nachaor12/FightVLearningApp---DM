import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';
import 'package:my_aplication_proeyctdm1/screen/likes_page.dart';
import 'package:my_aplication_proeyctdm1/screen/profile_page.dart';
import 'package:my_aplication_proeyctdm1/screen/game_page.dart';

var logger = Logger();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Drawer Demo';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FightVlearning',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 135, 173)),
      ),
      home: const MyHomePage(title: 'Home'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Videogame> listGamesHome = <Videogame>[
    Videogame(
      name: 'Street Fighter III: third strike', 
      image: AssetImage("assets/icons/sf3-3rd-strike-logo.png"),
      listButtonsPages: [
        AssetImage("assets/icons/sf3-3rdstrike-art-by-kinu-unfinished.jpg"),
        AssetImage("assets/icons/Gamest_Mook_Vol_194.webp"),
        AssetImage("assets/icons/sf3-3rd-strike-characters-daigo-ikeno.jpg"),
        AssetImage("assets/icons/SFIII_3S-Ken_Ending-1.webp"),
      ],
      //imageInfo: AssetImage("assets/icons/sf3-3rdstrike-art-by-kinu-unfinished.jpg"),
      //imageTutorial: AssetImage("assets/icons/Gamest_Mook_Vol_194.webp"),
      //imageCharacters: AssetImage("assets/icons/sf3-3rd-strike-characters-daigo-ikeno.jpg"),
      //imageMyCombos: AssetImage("assets/icons/SFIII_3S-Ken_Ending-1.webp"),
      released: 1999, 
      developer: 'CAPCOM', 
      favorite: false, 
      icon: Icon(Icons.favorite_border, size: 30, color: Colors.redAccent),
      description: 'El tercer videojuego enumerado de la saga original "Street Fighter"',
      listTutorial: [
        'Movimiento: ',
        'Mecanicas: ',
        'HUD/Interfaz: ',
        'Ataque: ',
        'Defensa: ',
        ],
      listCharacters: []
    ),

    /*Videogame(
      name: 'Street Fighter III: third strike', 
      image: AssetImage("assets/icons/sf3-3rd-strike-logo-2.jpg"),
      released: 1999, 
      developer: 'CAPCOM', 
      favorite: false, 
      icon: Icon(Icons.favorite_border, size: 30, color: Colors.redAccent),
      description: 'El tercer videojuego enumerado de la saga original "Street Fighter"',
      listTutorial: [
        'Movimiento: ',
        'Mecanicas: ',
        'HUD/Interfaz: ',
        'Ataque: ',
        'Defensa: ',
        ],
      listCharacters: []
    ),*/
  ];

  
  Icon favoriteIcon = Icon(Icons.favorite_border);

  void changeFavorite(Videogame game){
    setState(() {
      game.favorite = !game.favorite;
      if(game.favorite != true){
        game.icon = Icon(Icons.favorite_border, size: 30, color: Colors.redAccent);
      }
      else{
        game.icon = Icon(Icons.favorite_sharp, size: 30, color: Colors.redAccent);
      }
      logger.d(game.favorite);
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.orangeAccent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.favorite_border)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
              title: const Text('Opciones', textScaler: TextScaler.linear(1),),
              backgroundColor:  const Color.fromARGB(255, 255, 151, 41),
            ),
            body: Center(
              child: ListView.builder(
                itemCount: listGamesHome.length,
                itemBuilder: (context, index){
                  final game = listGamesHome[index];
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
                                        onPressed: () => changeFavorite(game), 
                                        child: game.icon
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              /*child: Stack(
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
                              ),*/
                            ),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
              },
            ),
            ListTile(
              title: const Text('Likes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyLikespage()));
              },
            ),
          ],
        ),
      ),
      
    );
  }

  
}