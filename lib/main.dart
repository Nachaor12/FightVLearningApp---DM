import 'package:flutter/material.dart';
import 'package:fightvlearning_app/services/notifications.dart';
import 'package:provider/provider.dart';
import 'package:fightvlearning_app/screen/home_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appData = AppData();
  await appData.loadPreferences(); // Carga inicial
  
  await initNotifications();
  
  runApp(
    ChangeNotifierProvider.value(
      value: appData,
      child: const MyApp(),
    ),
  );
}


