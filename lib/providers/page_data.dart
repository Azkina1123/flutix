part of "providers.dart";

class PageData extends ChangeNotifier {
  int _currIndex = 0;

  int get currIndex => _currIndex;

  void changeMenu(int index) {
    _currIndex = index;
    notifyListeners();
  }
}
