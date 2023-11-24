part of "providers.dart";

class TopUpSelectionData extends ChangeNotifier {
  int _templateSelected = -1;

  int get templateSelected => _templateSelected;

  void changeSelection(int index) {
    _templateSelected = index;
    notifyListeners();
  }
}
