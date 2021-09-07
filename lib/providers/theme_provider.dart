import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _pref;
  bool _isLightTheme = true;
  ThemeProvider() {
    _isLightTheme = true;
    _loadFromPrefs();
  }

  // _initPref() is to iniliaze  the _pref variable
  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isLightTheme = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _isLightTheme);
  }

  bool get isLightTheme => _isLightTheme;

  Future<void> changeTheme() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.getBool("isLightTheme");
    _isLightTheme = !_isLightTheme;
    _saveToPrefs(); // add this line

    notifyListeners();
  }
}
