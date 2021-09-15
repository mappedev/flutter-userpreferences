import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/screens/home_screen.dart';
import 'package:userpreferencesapp/src/screens/settings_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menu-img.jpg'),
                fit: BoxFit.cover
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => Navigator.pushReplacementNamed(context, HomeScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.party_mode),
            title: const Text('Fiesta'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Personas'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () {
              /**
               * * navegar a otra sección, cerrar el drawer y darle opción al 
               * * usuario de volver a la vista anterior con pushnamed
               * navigator.pop(context); para cerrar el drawer
               * navigator.pushnamed(context, settingsscreen.routename);
              */

              // * Navega a la página y se coloca cómo página raíz de navegación
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            }
          ),
        ],
      ),
    );
  }
}