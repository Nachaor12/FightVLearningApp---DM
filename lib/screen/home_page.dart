import 'package:fightvlearning_app/screen/about_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:fightvlearning_app/entity/videogame.dart';
import 'package:fightvlearning_app/screen/likes_page.dart';
import 'package:fightvlearning_app/screen/profile_page.dart';
import 'package:fightvlearning_app/screen/game_page.dart';
import 'package:fightvlearning_app/screen/preferences.dart';
import 'package:fightvlearning_app/provider/appdata.dart';

var logger = Logger();

//Variables para preferencias y otras más de uso común entre pantallas


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FightV-learning',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 183, 58, 100)),
        //textTheme: GoogleFonts.bebasNeueTextTheme(),
        //textTheme: GoogleFonts.permanentMarkerTextTheme(),
        //textTheme: GoogleFonts.bangersTextTheme(),
        //textTheme: GoogleFonts.francoisOneTextTheme(),
        //textTheme: GoogleFonts.vinaSansTextTheme(),
      ),
      home: MyHomePage(title: 'Inicio',),
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
      id: 1,
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

  String showUserDraw(BuildContext context, int index){
    if(context.watch<AppData>().users.isNotEmpty){
      switch (index){
        case 1:
        return context.watch<AppData>().users[context.watch<AppData>().users.length - 1].name;
        case 2:
        return context.watch<AppData>().users[context.watch<AppData>().users.length - 1].email;
      }
    }else{
      if(context.watch<AppData>().usersIsEmpty){
        switch (index){
          case 1:
          return 'Empty User';
          case 2:
          return 'Empty_User@gmail.com';
        }
      }
      else{
        switch (index){
          case 1:
          return context.watch<AppData>().newNameUser;
          case 2:
          return context.watch<AppData>().newEmailUser;
        }
      }
      
    }
    return 'There Not User';
  }
  
  ImageProvider userEmptyImage = AssetImage("assets/icons/icon_userempty.png");
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    //final appData = Provider.of<AppData>(context, listen: false);
    //print("✔️ Usuario después del frame: ${appData.newNameUser}");
    //print('Lista vacia: ${appData.users.isEmpty}');
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: context.watch<AppData>().tabIndex,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.orangeAccent,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () { Scaffold.of(context).openDrawer(); },
              );
            },
          ),
        ),
        body: Center(
          child: Scaffold(
            appBar: PreferredSize(preferredSize:Size.fromHeight(80), 
              child: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "Videojuegos", icon: Icon(Icons.sports_esports)),
                    Tab(text: "Favoritos",icon: Icon(Icons.favorite_sharp)),
                    Tab(text: "Perfil",icon: Icon(Icons.person)),
                  ],
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Color.fromARGB(255, 25, 107, 175),
                  labelColor: Color.fromARGB(255, 25, 107, 175),
                ),
                //title: const Text('Videojuegos', textScaler: TextScaler.linear(1),),
                backgroundColor:  const Color.fromARGB(255, 255, 151, 41),
              ),
            ),
            body: TabBarView(children: [
              gameListPage(),
              MyLikespage(),
              MyProfilePage(),
            ]),//gameListPage(),
          ),
        ),
        drawer: Consumer<AppData>(
          builder: (context, appData, _) => Drawer(
            child: Builder(
              builder: (context) => ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(showUserDraw(context, 1)), 
                    accountEmail: Text(showUserDraw(context, 2)),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: context.watch<AppData>().changeImageUser(userEmptyImage)
                    ),
                    
                  ),
                  const Divider(height: 0.1,),
                  ListTile(title: const Text('Inicio'), leading: Icon(Icons.home), onTap: () { Navigator.pop(context); 
                      DefaultTabController.of(context).animateTo(0);
                    },
                  ),
                  const Divider(height: 0.1,),
                  ListTile(title: const Text('Mis juegos'), leading: Icon(Icons.sports_esports), onTap: () { Navigator.pop(context); 
                      DefaultTabController.of(context).animateTo(1);
                    },
                  ),
                  const Divider(height: 0.1,),
                  ListTile(title: const Text('Perfil'), leading: Icon(Icons.person), onTap: () { Navigator.pop(context);
                      DefaultTabController.of(context).animateTo(2);
                    },
                  ),
                  const Divider(height: 0.1,),
                  ListTile(title: const Text('Preferencias'), leading: Icon(Icons.settings), onTap: () { Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PreferencesPage()));
                    },
                  ),
                  const Divider(height: 0.1,),
                  ListTile(title: const Text('Acerca de'), leading: Icon(Icons.info), onTap: () { Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
                    },
                  ),
                  const Divider(height: 0.1,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center gameListPage() {
    return Center(
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
    );
  }
}