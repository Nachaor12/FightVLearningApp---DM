import 'package:flutter/material.dart';
import 'package:my_aplication_proeyctdm1/services/notifications.dart';
import 'package:provider/provider.dart';
import 'package:my_aplication_proeyctdm1/screen/home_page.dart';


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


