import 'package:flutter/material.dart';

import 'package:userpreferencesapp/src/widgets/drawer_widget.dart';

import 'package:userpreferencesapp/src/share_prefs/user_prefs.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _isColorSecondary;
  late int _gender;
  late String _name;

  late TextEditingController _textController;

  final UserPrefs prefs = UserPrefs();

  @override
  void initState() {
    super.initState();

    prefs.lastPage = SettingsScreen.routeName;

    _isColorSecondary = prefs.isColorSecondary;
    _gender = prefs.gender;
    _name = prefs.name;

    _textController = TextEditingController(text: _name);
  }

  _setSelectedRadio(int? value) async {
    final int valueValidated = value ?? 1;

    setState(() => _gender = valueValidated);

    prefs.gender = valueValidated;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ajustes'),
        backgroundColor: prefs.isColorSecondary ? Colors.teal : Colors.blue,
      ),
      drawer: const DrawerWidget(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            child: const Text(
              'Ajustes',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          SwitchListTile(
            value: _isColorSecondary, 
            title: const Text('Color secundario'),
            onChanged: (value) {
              setState(() => _isColorSecondary = value);
              prefs.isColorSecondary = value;
            }
          ),
          RadioListTile(
            value: 1,
            title: const Text('Masculino'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: const Text('Femenino'),
            groupValue: _gender,
            onChanged: _setSelectedRadio,
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el teléfono'
              ),
              onChanged: (String value) {
                _name = value;
                prefs.name = value;
              }
            ),
          )
        ],
      ),
    );
  }
}