import 'package:fightvlearning_app/screen/about_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fightvlearning_app/screen/home_page.dart';
import 'package:provider/provider.dart';
import 'package:fightvlearning_app/provider/appdata.dart';


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
            UserAccountsDrawerHeader(
              accountName: Text(context.read<AppData>().newNameUser), 
              accountEmail: Text(context.read<AppData>().newEmailUser),
              currentAccountPicture: CircleAvatar(
                backgroundImage: context.read<AppData>().userEmptyImage,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
              },
            ),
            const Divider(height: 0.1,),
          ],
        ),
      ),
    );
  }

}
