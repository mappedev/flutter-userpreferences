import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:userpreferencesapp/src/widgets/drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isColorSecondary = false;
  int _gender = 1;
  String _name = 'Mario';

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      _gender = prefs.getInt('gender')!;
    });

    _textController = TextEditingController(text: _name);
  }

  _setSelectedRadio(int? value) async {
    final int valueValidated = value ?? 1;

    setState(() => _gender = valueValidated);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('gender', valueValidated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ajustes'),
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
              onChanged: (String value) => _name = value,
            ),
          )
        ],
      ),
    );
  }
}