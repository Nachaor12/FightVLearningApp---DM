import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_aplication_proeyctdm1/entity/videogame.dart';
import 'package:my_aplication_proeyctdm1/screen/likes_page.dart';
import 'package:my_aplication_proeyctdm1/screen/profile_page.dart';
import 'package:my_aplication_proeyctdm1/screen/game_page.dart';

var logger = Logger();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'Acceso';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FightVlearning',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 16, 117, 154)),
      ),
      home: const MyHomePage(title: 'Inicio'),
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
        AssetImage("assets/icons/sf3-3rdstrike-art-by-kinu-unfinished.jpg"),  //Informacion general
        AssetImage("assets/icons/Parry_the_ball_bonus_game_sf3.png"),         //Tutorial general
        AssetImage("assets/icons/sf3-3rd-strike-characters-daigo-ikeno.jpg"), //Personajes
        AssetImage("assets/icons/SFIII_3S-Ken_Ending-1.webp"),                //Mis combos
        ////////////////////////////////////////////////////////////////////////////////////////////
        AssetImage("assets/icons/yang-3s-up.jpg"),                            //Movimiento
        AssetImage("assets/icons/Gamest_Mook_Vol_194.webp"),                  //Ataque
        AssetImage("assets/icons/SFIII_3S-Oro_Ending-3.webp"),                //Defensa
        AssetImage("assets/icons/HUD_image_round.png"),                      //Hud/Interfaz
        AssetImage("assets/icons/SFIII-Chun-Li-1.webp"),                      //Mecanicas
      ],
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
                  Tab(icon: Icon(Icons.sports_esports)),
                  Tab(icon: Icon(Icons.favorite_sharp)),
                  Tab(icon: Icon(Icons.person)),
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
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Mis juegos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyLikespage()));
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}