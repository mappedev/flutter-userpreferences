import 'package:shared_preferences/shared_preferences.dart';

import 'package:userpreferencesapp/src/screens/home_screen.dart';

class UserPrefs {
  factory UserPrefs() => _intance;
  UserPrefs._internal();

  static final UserPrefs _intance = UserPrefs._internal();

  late SharedPreferences _prefs;

  Future initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // * Getters y Setters
  bool get isColorSecondary => _prefs.getBool('isColorSecondary') ?? false;
  set isColorSecondary(bool newValue) => _prefs.setBool('isColorSecondary', newValue);

  int get gender => _prefs.getInt('gender') ?? 1;
  set gender(int newValue) => _prefs.setInt('gender', newValue);

  String get name => _prefs.getString('name') ?? '';
  set name(String newValue) => _prefs.setString('name', newValue);

  String get lastPage => _prefs.getString('lastPage') ?? HomeScreen.routeName;
  set lastPage(String newValue) => _prefs.setString('lastPage', newValue);
}