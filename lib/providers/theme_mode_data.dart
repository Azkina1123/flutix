part of "providers.dart";

class ThemeModeData extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get lightMode => _themeMode == ThemeMode.light;

  void changeTheme() {
    _themeMode = lightMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
