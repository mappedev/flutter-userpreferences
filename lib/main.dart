import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/screens/home_screen.dart';
import 'package:userpreferencesapp/src/screens/settings_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Preferences App',
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(), 
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}