import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_aplication_proeyctdm1/screen/home_page.dart';
import 'package:provider/provider.dart';

//https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png

class PreferencesPage extends StatefulWidget{
  const PreferencesPage({super.key});
  
  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  
  bool _isActiveNotiferEnabled = false;
  bool _isShareCombosEnabled = false;
  bool _isRecomendCombosEnabled = false;

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isActiveNotiferEnabled = prefs.getBool('isActiveNotiferEnabled') ?? false;
      _isShareCombosEnabled = prefs.getBool('isShareCombosEnabled') ?? false;
      _isRecomendCombosEnabled = prefs.getBool('isRecomendCombosEnabled') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isActiveNotiferEnabled', _isActiveNotiferEnabled);
    await prefs.setBool('isShareCombosEnabled', _isShareCombosEnabled);
    await prefs.setBool('isRecomendCombosEnabled', _isRecomendCombosEnabled);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _loadPreferences();
  });
  }

  @override
  void dispose() {
    _savePreferences();
    super.dispose();
  }
  
  void changeActiveNotifer(BuildContext context){
    context.read<AppData>().activeNotifer = !context.read<AppData>().activeNotifer;
  }
  void changeShareCombos(BuildContext context){
    context.read<AppData>().shareCombos = !context.read<AppData>().shareCombos;
  }
  void changeRecomendCombos(BuildContext context){
    context.read<AppData>().recomendCombos = !context.read<AppData>().recomendCombos;
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
        backgroundColor: const Color.fromARGB(255, 36, 131, 186),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
            );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Center(
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text('Activar Notificaciones'),
                    value: _isActiveNotiferEnabled, 
                    onChanged: (bool value) async{
                      setState(() {
                        _isActiveNotiferEnabled = value; 
                      });
                      changeActiveNotifer(context);
                      await _savePreferences();
                    },
                  ),
                  SwitchListTile(
                    title: Text('Compartir combos por Wifi'),
                    value: _isShareCombosEnabled, 
                    onChanged: (bool value) async{ 
                      setState(() {
                        _isShareCombosEnabled = value; 
                      });
                      changeShareCombos(context);
                      await _savePreferences(); 
                    },
                  ),
                  SwitchListTile(
                    title: Text('Recomendar nuevos combos'),
                    value: _isRecomendCombosEnabled, 
                    onChanged: (bool value) async{ 
                      setState(() {
                        _isRecomendCombosEnabled = value; 
                      });
                      changeRecomendCombos(context);
                      await _savePreferences();
                    },
                  ),
                ],
              )
            ) 
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Ignacio Alfaro"), 
              accountEmail: Text("nachoar.12.73.19@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  //'https://yt3.googleusercontent.com/P1HN1TEmdSyQa_sxDt1Az-o2oUVz-N3ivnykzw2Ah-alUHKXt5FeUs75Y4B1aKz4wRBD848XpA=s900-c-k-c0x00ffffff-no-rj'
                  //'https://cdn.marvel.com/content/1x/036dpl_com_mas_dsk_03.jpg'
                  'https://pbs.twimg.com/media/GIQhQh3XwAARA1R.jpg:large'
                ),
              ),
              
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Inicio'), leading: Icon(Icons.home), onTap: () { Navigator.pop(context); 
                context.read<AppData>().tabIndex = 0;
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio')));
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Mis juegos'), leading: Icon(Icons.sports_esports), onTap: () { Navigator.pop(context); 
                context.read<AppData>().tabIndex = 1;
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio',)));
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Perfil'), leading: Icon(Icons.person), onTap: () { Navigator.pop(context);
                context.read<AppData>().tabIndex = 2;
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Inicio',)));
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Preferencias'), leading: Icon(Icons.settings), onTap: () { Navigator.pop(context);
              },
            ),
            const Divider(height: 0.1,),
            ListTile(title: const Text('Acerca de'), leading: Icon(Icons.info), onTap: () { Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
              },
            ),
            const Divider(height: 0.1,),
          ],
        ),
      ),
    );
  }

}
