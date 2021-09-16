import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/screens/home_screen.dart';
import 'package:userpreferencesapp/src/screens/settings_screen.dart';

import 'package:userpreferencesapp/src/share_prefs/user_prefs.dart';
 
void main() async {
  // * Necesitamos indicarle a flutter que primero se ejecutará código
  // * en el main y luego se contruirá la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  // * También es útil si necesitamos esperar que el binding de los
  // * Widgets esté listo

  // * Aquí inicializamos UserPrefs sin ningún problema porque es un Singleton
  final UserPrefs prefs = UserPrefs();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserPrefs prefs = UserPrefs();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences App',
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(), 
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      initialRoute: prefs.lastPage,
    );
  }
}