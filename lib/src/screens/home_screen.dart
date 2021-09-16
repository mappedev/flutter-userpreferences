import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/widgets/drawer_widget.dart';

import 'package:userpreferencesapp/src/share_prefs/user_prefs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    final UserPrefs prefs = UserPrefs();

    prefs.lastPage = HomeScreen.routeName;

    /** 
     * * Lo siguiente no funcionará porque prefs.initPrefs es un método asíncrono
     * * y necesitamos que se ejecute primero y luego se contruya el Scaffold
     * prefs.initPrefs();
    */ 
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Preferencias de usuario'),
        backgroundColor: prefs.isColorSecondary ? Colors.teal : Colors.blue,
      ),
      drawer: const DrawerWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario activado: ${prefs.isColorSecondary ? 'Si' : 'No'}'),
          const Divider(),
          Text('Género: ${prefs.gender == 1 ? 'Masculino' : 'Femenino'}'),
          const Divider(),
          Text('Nombre de usuario: ${prefs.name.isNotEmpty ? prefs.name : 'Sin nombre'}'),
          const Divider(),
        ],
      ),
    );
  }
}
